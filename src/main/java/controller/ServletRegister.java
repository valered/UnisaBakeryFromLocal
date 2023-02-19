package controller;

import model.Utente.Utente;
import model.Utente.UtenteDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletRegister", value = "/ServletRegister")
public class ServletRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utente user = (Utente) request.getSession().getAttribute("user");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String psw = request.getParameter("psw");
        String username = request.getParameter("username");
        String citta = request.getParameter("citta");
        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String telefono = request.getParameter("telefono");

        Utente utente= new Utente();
        if(user==null||(!user.isIfAdmin())){

        utente.setNome(nome);
        utente.setEmail(email);
        utente.setPsword(psw);
        utente.setUsername(username);
        utente.setCitta(citta);
        utente.setVia(via);
        utente.setCap(cap);
        utente.setTelefono(telefono);
        utente.setIfAdmin(false);
        //System.out.println(utente.toString());
        }
        else if(user.isIfAdmin()){
            utente.setNome(nome);
            utente.setEmail(email);
            utente.setPsword(psw);
            utente.setUsername(username);
            utente.setCitta(citta);
            utente.setVia(via);
            utente.setCap(cap);
            utente.setTelefono(telefono);
            utente.setIfAdmin(true);
            //System.out.println(utente.toString());
        }


        UtenteDAO utenteDAO = new UtenteDAO();
        String address=null;

        if(utenteDAO.controllaEmail(utente)){
            //System.out.println("Sono entrato nell'if di controlla email");
            address="/views/EmailGiaInUso.jsp";
            System.out.println("email già presente in database");
        }else if(utenteDAO.controllaNomeUtente(utente)){
            //System.out.println("Sono entrato nell'if di controlla nome u");
            address="/views/nomeUtenteGiaInUso.jsp";
            System.out.println("nome utente già presente in database");
        }else{
            if(utenteDAO.insertUtente(utente)){
                //System.out.println("Sono entrato nell if dell'inserimento");
                System.out.println("Inserimento effettuato");
                if(user.isIfAdmin()){
                    address="index.jsp";
                }
                else
                    address="/views/RegistrazioneEffettuata.jsp";
            }
            else{
                //System.out.println("Sono entrato nell else dell'inserimento");
                System.out.println("Inserimento NON effettuato");
                address="/views/RegistrazioneNonEffettuata.jsp";
            }
        }


        if(!utente.isIfAdmin()){
            HttpSession session = request.getSession(true);
            session.setAttribute("user", utente);}
        RequestDispatcher requestDispatcher= request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
