package controller;

import model.Carrello;
import model.Cart.CartItem;
import model.Cart.CartItemDAO;
import model.Dolci.Dolci;
import model.Dolci.DolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "ServletRimuoviProdotto", value = "/ServletRimuoviProdotto")
public class ServletRimuoviProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente user = (Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();

        if(user==null){
            RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/UtenteNonLoggato.jsp");
            requestDispatcher.forward(request, response);
        }
        else if(!user.isIfAdmin()){
            System.out.println("Sono nel else if");
            String codiceString = request.getParameter("codiceDolce");
            int codiceDolce = Integer.parseInt(codiceString);

            DolciDAO dolciDAO = new DolciDAO();
            Dolci dolce = dolciDAO.cercaDolceByCodice(codiceDolce);
            CartItemDAO cartItemDAO = new CartItemDAO();
            CartItem cartItem = new CartItem();
            cartItem.setDolce(dolce);
            cartItem.setEmailUtente(user.getEmail());
            if(cartItem!=null){
                if(cartItemDAO.cancellaDolce(cartItem)){
                    RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(request, response);
                }
                else {
                    RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/error500.jsp");
                    requestDispatcher.forward(request, response);
                }
            }



        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
