package controller;

import model.Dolci.DolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletEliminaProdotto", value = "/ServletEliminaProdotto")
public class ServletEliminaProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utente user = (Utente) request.getSession().getAttribute("user");
        if(user.isIfAdmin()){
            DolciDAO dolciDAO = new DolciDAO();
            int codiceDolce= Integer.parseInt(request.getParameter("codiceDolce"));
            if(dolciDAO.deleteDolce(codiceDolce)){
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }
            else {
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/error500.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }
}
