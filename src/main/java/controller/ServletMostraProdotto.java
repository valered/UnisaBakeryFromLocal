package controller;

import model.Dolci.Dolci;
import model.Dolci.DolciDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletMostraProdotto", value = "/ServletMostraProdotto")
public class ServletMostraProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String codiceString = request.getParameter("codice");
        //System.out.println("In servlet mostra prodotto codice String:"+codiceString);
        if(codiceString!=null){
            int codideDolce = Integer.parseInt(codiceString);
            DolciDAO dolciDAO = new DolciDAO();
            Dolci dolce = dolciDAO.cercaDolceByCodice(codideDolce);
            HttpSession session = request.getSession(true);
            session.setAttribute("dolce", dolce);

            RequestDispatcher requestDispatcher= request.getRequestDispatcher("views/mostraProdotto.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
