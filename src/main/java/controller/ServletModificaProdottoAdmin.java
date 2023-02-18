package controller;

import model.Dolci.Dolci;
import model.Dolci.DolciDAO;
import model.Utente.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletModificaProdottoAdmin", value = "/ServletModificaProdottoAdmin")
public class ServletModificaProdottoAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Utente user = (Utente) request.getSession().getAttribute("user");
        DolciDAO dolciDAO = new DolciDAO();
        int codice = Integer.parseInt(request.getParameter("codiceDolce"));
        Dolci dolce = dolciDAO.cercaDolceByCodice(codice);
        String descrizione = request.getParameter("descrizione");
        String tipologiaString = request.getParameter("tipologia");
        int tipologia = Integer.parseInt(tipologiaString);
        String pesoString = request.getParameter("peso");
        double peso = Double.parseDouble(pesoString);
        String prezzoString = request.getParameter("prezzoKg");
        double prezzo = Double.parseDouble(prezzoString);
        if(user.isIfAdmin()){
            dolce.setIdTipologia(tipologia);
            dolce.setDescrizione(descrizione);
            dolce.setPeso(peso);
            dolce.setPrezzoAlKg(prezzo);
           if(dolciDAO.updateDolce(dolce)){
               RequestDispatcher requestDispatcher= request.getRequestDispatcher("index.jsp");
               requestDispatcher.forward(request, response);
           }
           else
           {
               RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/error500.jsp");
               requestDispatcher.forward(request, response);
           }
        }

    }
}
