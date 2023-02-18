package controller;

import model.Utente.Utente;
import model.Utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletModificaDatiPersonali", value = "/ServletModificaDatiPersonali")
public class ServletModificaDatiPersonali extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utente user=(Utente) request.getSession().getAttribute("user");
        String nome = request.getParameter("nome");
        String psw = request.getParameter("psw");
        String username = request.getParameter("username");
        String citta = request.getParameter("citta");
        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String telefono = request.getParameter("telefono");

        Utente utente= new Utente();
        utente.setNome(nome);
        utente.setEmail(user.getEmail());
        utente.setPsword(psw);
        utente.setUsername(username);
        utente.setCitta(citta);
        utente.setVia(via);
        utente.setCap(cap);
        utente.setTelefono(telefono);
        utente.setIfAdmin(false);
        System.out.println(utente.toString());

        UtenteDAO utenteDAO = new UtenteDAO();
        String address;
        if(utenteDAO.updateUtente(utente)){
            System.out.println("Sono entrata nell if dell'inserimento");
            System.out.println("Update effettuato");
            address="/views/home.jsp";
        }
        else{
            System.out.println("Sono entrata nell else dell'inserimento");
            System.out.println("Inserimento NON effettuato");
            address="/views/RegistrazioneNonEffettuata.jsp";
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("user", utente);
        RequestDispatcher requestDispatcher= request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);
    }

    }

