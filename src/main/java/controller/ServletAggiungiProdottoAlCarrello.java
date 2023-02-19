package controller;

import model.Cart.CartItem;
import model.Cart.CartItemDAO;
import model.Dolci.Dolci;
import model.Dolci.DolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletAggiungiProdottoAlCarrello", value = "/ServletAggiungiProdottoAlCarrello")
public class ServletAggiungiProdottoAlCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utente user = (Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();

        if(user==null){
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/UtenteNonLoggato.jsp");
            requestDispatcher.forward(request, response);
        }
        else if(!user.isIfAdmin()){
            //System.out.println("Sono nel else if");
            String codiceString = request.getParameter("codiceDolce");
            //System.out.println(codiceString.getClass());
            int codiceDolce = Integer.parseInt(codiceString);
            String quantitaString = request.getParameter("quantita");
            int quantita= Integer.parseInt(quantitaString);
            DolciDAO dolciDAO = new DolciDAO();
            Dolci dolce = dolciDAO.cercaDolceByCodice(codiceDolce);
            CartItemDAO cartItemDAO = new CartItemDAO();
            CartItem cartItem = new CartItem();
            cartItem.setQuantita(quantita);
            cartItem.setDolce(dolce);
            cartItem.setEmailUtente(user.getEmail());
            try {
                cartItemDAO.insertCartItem(cartItem);
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);

                }catch (SQLException e) {
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/error500.jsp");
                requestDispatcher.forward(request, response);
                e.printStackTrace();
            }


        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }
}
