<%@ page import="model.Dolci.DolciDAO" %>
<%@ page import="model.Dolci.Dolci" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente.Utente" %>
<%@ page import="model.OrdineDolci.AllOrdini" %>
<%@ page import="model.Ordine.Ordine" %>
<%@ page import="model.OrdineDolci.OrdineDolci" %>
<%@ page import="model.OrdineDolci.OrdineDolciDAO" %>
<%@ page import="model.Ordine.OrdineDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title> MOSTRA ORDINI </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>

    <style>


        html,body{
            font-family: Arsenal, sans-serif;
            background:radial-gradient(#cc977b, #b77653);
        }
        *{
            font-family: Arsenal, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .container {
            padding: 60px 0;
        }
        @media (max-width: 600px) {
            .container {
                padding: 40px 40px;
            }
        }



        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }

        /*----------------------------------- STILE HEADER -----------------------------------*/
        .header {
            padding: 50px;
            text-align: center;
            background-image:  url("/immagini/logo.png");
        }

        .header h1 {
            font-size: 40px;
        }

        /*----------------------- STILE BARRA DI NAVIGAZIONE---------------------------------*/
        .navbar {
            overflow: hidden;
            background-color: #cc977b;
        }

        .responsive-image{
            height:auto;
            width:70%;
        }


        .navbar a {       /* LINK BARRA DI NAVIGAZIONE */
            float: left;
            display: block;
            color: white;
            font-family: "Arsenal",sans-serif;
            font-style: normal;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        .navbar a.right {   /* LINK DELLA BARRA DI NAVIGAZIONE A DESTRA */
            float: right;
        }


        .navbar a:hover,.dropdown:hover .dropbtn {    /* PASSAGGIO DEL MOUSE SUGLI ELEMENTI */
            background-color: #ddd;
            color: black;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: white;
            padding: 14px 16px;
            background-color: inherit;
            font-family: Arsenal;
            margin: 0;
            cursor: pointer;
        }



        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /*-------------------------------STILE TABELLA-------------------------------*/
        table {
            position: center;
            margin-bottom: 0px;
            margin-top: 30px;
            margin-left: 20px;
            border:1px solid black;
            /*border-collapse: collapse;*/
            width: 97%;
        }
        .interna{
            margin-bottom: 20px;
            margin-top: 1px;
            margin-left: 20px;
            border:1px solid black;
            width: 97%;
        }
        .interna  td,th {
            text-align: left;
            padding: 8px;
        }

        td,th {
            text-align: left;
            padding: 8px;
        }

        th{
            color: white;
        }
        tr:nth-child(even) {background-color: #f2f2f2;}
        div #img {
            width: 80px;
            height:80px;
            background-repeat: no-repeat;
            background-size: contain;
            border-radius:50%;
        }

        hr {
            border:1px solid #cc977b;
            color: #cc977b;
            background-color: #cc977b;
            height: 2px;
            width: 100%;
            margin-bottom: 10px;
            margin-top: 30px;

        }

    </style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



<!-- mi richiamo la tipologia e l'array dei dolci di quella tipologia-->
<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
    OrdineDolciDAO ordineDolciDAO = new OrdineDolciDAO();

    ArrayList<Ordine> ordini = new ArrayList<>();
    OrdineDAO ordineDAO = new OrdineDAO();
    ordini=ordineDAO.selectAllOrdini();
    DolciDAO dolciDAO = new DolciDAO();

%>

<!-- barra dei menù rispettivamente della home-->
<!-- visitatore (non loggato)-->
<%if(user==null){%>
<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="../immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="login.jsp" class="right">LOGIN - REGISTRATI <i class="fas fa-sign-in-alt" ></i> </a>
</div>
<%}
else if(!user.isIfAdmin()){%>
<!-- utente loggato-->

<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="../immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a class="right"> <div class="dropdown" >
        <form action="../ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
    <a href="mostraOrdiniUtente.jsp" class="right">VISUALIZZA ORDINI <i class="fas fa-list"></i></a>
    <a href="ModificaAreaPersonale.jsp" class="right"><%=user.getUsername()%> <i class="far fa-user"></i></a>
    <a href="VisualizzaCarrello.jsp" class="right" >CARRELLO <i class="fas fa-shopping-cart" ></i></a>
</div>


<%}else if(user.isIfAdmin()) {%>
<!-- amministratore-->


<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="../immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <!--<div class="dropdown">
        <button class="dropbtn">IMPOSTAZIONI
            <i class="fas fa-user-cog"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">MODIFICA DOLCI</a>
            <a href="#">MODIFICA TIPOLOGIA</a>
            <a href="#">MODIFICA CLIENTI</a>
        </div>
    </div>-->
    <a href="Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="../ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>

</div>

<%}%>






<!-- ELENCO PRODOTTI-->
<% if(user.isIfAdmin()){%>
<!--
<div style="overflow-x:auto;">
    <table>
        <tr>
            <th>id Ordine</th>
            <th>data Ordine</th>
            <th>email utente </th>
            <th>codice dolce</th>
            <th>nome dolce</th>
            <th>quantita</th>
        </tr>
        < %
            for(Ordine ordine : ordini){
                ArrayList<OrdineDolci> ordineDolci = new ArrayList<>();
                ordineDolci=ordineDolciDAO.selectAllOrdineDolciById(ordine.getIdOrdine());
                 for (OrdineDolci od : ordineDolci){
        Dolci dolce = dolciDAO.cercaDolceByCodice(od.getCodiceDolci());
        %>
        <tr class="text-center">
            <td class="product-name">< %=od.getIdOrdine()%></td>
            <td>< %=ordine.getDataOrdine()%></td>
            <td>< %=ordine.getEmail()%></td>
            <td>< %=od.getCodiceDolci()%></td>
            <td>< %=dolce.getNome()%></td>
            <td>< %=od.getQuantita()%></td>
        </tr> < % }} %>
    </table>

        < %}%>  // chiusure graffa nel commento
</div>-->

<!--------------------------------PROVA 2--------------------------------------->
<%for(Ordine o: ordini){
    ArrayList<OrdineDolci> ordineDolci = new ArrayList<>();
    ordineDolci=ordineDolciDAO.selectAllOrdineDolciById(o.getIdOrdine());
    double tot=0; %>
<table>
    <tr>
        <th>ID ORDINE</th>
        <th>DATA ORDINE</th>
        <th>EMAIL ORDINE</th>
    </tr>
    <tr>
        <td><%=o.getIdOrdine()%></td>
        <td><%=o.getDataOrdine()%></td>
        <td><%=o.getEmail()%></td>
    </tr>
</table>
<table class="interna">
    <tr>
        <th>CODICE DOLCE</th>
        <th>NOME DOLCE</th>
        <th>PREZZO AL KG</th>
        <th>PESO</th>
        <th>QUANTITA</th>
    </tr>
<%for(OrdineDolci od : ordineDolci){
Dolci dolce = dolciDAO.cercaDolceByCodice(od.getCodiceDolci());%>
    <tr>
        <td><%=dolce.getCodice()%></td>
        <td><%=dolce.getNome()%></td>
        <td><%=dolce.getPrezzoAlKg()%></td>
        <td><%=dolce.getPeso()%></td>
        <td><%=od.getQuantita()%></td>
    </tr>
<% tot+=dolce.getPrezzoAlKg()*od.getQuantita()*dolce.getPeso();
}%>
    <tr>
        <td colspan="4" style="text-align:right">Totale:</td><td><%=tot%></td>
    </tr>
</table>
<hr style="color: #ABCDEF">
<%}%>

<%}%> <!-- chiusura graffa fuori dal commento-->

</body>
</html>