package controller;

import model.Dolci.Dolci;
import model.Dolci.DolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCreaProdotto", value = "/ServletCreaProdotto")
public class ServletCreaProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("sono entrata in Servlet Prodotto ");
        Utente user = (Utente) request.getSession().getAttribute("user");
        Dolci dolce = new Dolci();
        DolciDAO dolciDAO = new DolciDAO();
        if(user.isIfAdmin()){
            dolce.setCover(request.getParameter("cover"));
            dolce.setNome(request.getParameter("nome"));
            dolce.setDescrizione(request.getParameter("descrizione"));
            dolce.setTempoConservazione(request.getParameter("Tconservazione"));
            System.out.println("Tcons: "+ request.getParameter("Tconservazione") );
            dolce.setTempoCottura(request.getParameter("Tcottura"));
            System.out.println("Tcott: "+ request.getParameter("Tcott") );
            double peso = Double.parseDouble(request.getParameter("peso"));
            dolce.setPeso(peso);
            System.out.println("peso :" +peso);
            int codice = Integer.parseInt(request.getParameter("codice"));
            dolce.setCodice(codice);
            System.out.println("codice"+codice);
            double prezzoAlKg = Double.parseDouble(request.getParameter("prezzoKg"));
            dolce.setPrezzoAlKg(prezzoAlKg);
            int idTipologia=Integer.parseInt(request.getParameter("tipologia"));
            dolce.setIdTipologia(idTipologia);

            if(dolciDAO.insertDolce(dolce)){
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }else{
                RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/error500.jsp");
                requestDispatcher.forward(request, response);
            }


        }
    }
}
