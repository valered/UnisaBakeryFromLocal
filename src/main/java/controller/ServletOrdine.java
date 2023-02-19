package controller;

import model.Carrello;
import model.Cart.CartItem;
import model.Cart.CartItemDAO;
import model.Dolci.Dolci;
import model.Dolci.DolciDAO;
import model.Ordine.Ordine;
import model.Ordine.OrdineDAO;
import model.OrdineDolci.OrdineDolci;
import model.OrdineDolci.OrdineDolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "ServletOrdine", value = "/ServletOrdine")
public class ServletOrdine extends HttpServlet {
    private static final String FORMAT = "dd-MM-yyyy";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println("Sono in servlet ordine");
        Utente user = (Utente) request.getSession().getAttribute("user");
        /*-----------------CREO ORDINE ---------------------------------*/
        Ordine ordine = new Ordine();
        OrdineDAO ordineDAO = new OrdineDAO();
        DateFormat df = new SimpleDateFormat(FORMAT);
        Date now = (Date) Calendar.getInstance().getTime();
        String strDate = df.format(now);
        ordine.setDataOrdine(strDate);
        ordine.setEmail(user.getEmail());
        int idOrdine =ordineDAO.contaOrdini() +1;
        ordine.setIdOrdine(idOrdine);
        //System.out.println("idordine " + idOrdine);

        /*--------------------- RECUPERO IL CARRELLO DAL DB---------------------------*/
        CartItemDAO cartItemDAO = new CartItemDAO();
        ArrayList<CartItem> carrello = null;
        try {
            carrello = cartItemDAO.selectAllCartByEmail(user.getEmail());
        } catch (SQLException e) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/error500.jsp");
            e.printStackTrace();
        }

        /*--------------------- CREO ORDINE-DOLCI PER OGNI ITEM----------------------*/
        if(ordineDAO.insertOrdine(ordine)) {
            if (carrello != null) {
                //System.out.println("Sono nell'if carrello!= null");
                for (CartItem c : carrello) {
                    OrdineDolci ordineDolci = new OrdineDolci();
                    OrdineDolciDAO ordineDolciDAO = new OrdineDolciDAO();
                    Dolci dolce = c.getDolce();
                    int quantita = c.getQuantita();
                    if (c.getDolce() != null && quantita != 0) {
                        int codiceDolce = dolce.getCodice();
                        ordineDolci.setQuantita(quantita);
                        ordineDolci.setCodiceDolci(codiceDolce);
                        ordineDolci.setIdOrdine(idOrdine);
                        ordineDolciDAO.insertOrdineDolci(ordineDolci);
                        System.out.println("Ordine Dolci inserito");
                    }
                }
                System.out.println("Ordine completato");
                cartItemDAO.cancellaTuttiDolciUtente(user.getEmail());
            }
        }

        RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/ordineEffettuato.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }
}
