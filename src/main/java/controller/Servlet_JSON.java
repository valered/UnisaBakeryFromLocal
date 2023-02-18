package controller;

import model.Dolci.Dolci;
import model.Dolci.DolciDAO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Locale;

@WebServlet(name = "Servlet_JSON", value = "/Servlet_JSON")
public class Servlet_JSON extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        String nome = request.getParameter("titolo");
        System.out.println("Sono della servlet JSON titolo: "+nome);
        DolciDAO dolciDAO = new DolciDAO();
        ArrayList<Dolci> dolciArrayList= new ArrayList<>();
        dolciArrayList=dolciDAO.selectAllDolci();

        ArrayList<Dolci> listaDolci2=new ArrayList<>();
        for(Dolci p: dolciArrayList)
        {

            if(p.getNome().toUpperCase(Locale.ROOT).contains(nome.toUpperCase(Locale.ROOT))){
                listaDolci2.add(p);
                System.out.println("Dolce nome:"+p.getNome());}
        }
        response.getWriter().append("[");
        for(int i=0; i<listaDolci2.size();i++)
        {
            response.getWriter().append(listaDolci2.get(i).toJSON());
            if(i != listaDolci2.size()-1){
                response.getWriter().append(",");
            }
        }
        response.getWriter().append("]");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
