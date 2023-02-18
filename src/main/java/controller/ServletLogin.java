package controller;

import model.Utente.Utente;
import model.Utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/ServletLogin")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nUtente= request.getParameter("nUtente");
        String password= request.getParameter("psw");
        System.out.println(nUtente +" "+ password);
        UtenteDAO utenteDAO = new UtenteDAO();
        Utente utente= utenteDAO.selectUtenteByNomeUtentePassword(nUtente,password);
        String address=null;
        if(utente.getUsername()== null || utente.getPsword()== null){
               address="views/ErroreUtentePassword.jsp";
        }
        else address="index.jsp";
        System.out.println(utente.toString());
        HttpSession session = request.getSession(true);
        session.setAttribute("user", utente);

        RequestDispatcher requestDispatcher= request.getRequestDispatcher(address);

        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doGet(request,response);
    }
    }
