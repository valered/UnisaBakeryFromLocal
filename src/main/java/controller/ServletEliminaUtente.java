package controller;

import model.Utente.Utente;
import model.Utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletEliminaAmministratore", value = "/ServletEliminaUtente")
public class ServletEliminaUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Utente user = (Utente) request.getSession().getAttribute("user");
        String address="";
        if(user.isIfAdmin()){
            UtenteDAO utenteDAO=new UtenteDAO();
            String email = request.getParameter("email");
            if(utenteDAO.deleteUtente(email)){
                address="index.jsp";
            }
            else {
                address="views/error500.jsp";
            }
        }

        RequestDispatcher requestDispatcher= request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }
}
