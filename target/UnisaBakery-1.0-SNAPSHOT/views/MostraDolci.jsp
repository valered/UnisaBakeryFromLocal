<%@ page import="model.Dolci.DolciDAO" %>
<%@ page import="model.Dolci.Dolci" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente.Utente" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title> MOSTRA DOLCI </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--link rel="stylesheet" href="../css/menu.css" type="text/css"-->
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

        .navbar a {  /* LINK BARRA DI NAVIGAZIONE */
            float: left;
            display: block;
            color: white;
            font-family: "Arsenal",sans-serif;
            font-style: normal;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        .navbar a.right {   /* ELEMENTI DELLA BARRA DI NAVIGAZIONE A DESTRA */
            float: right;
        }


        .navbar a:hover,.dropdown:hover .dropbtn {   /* PASSAGGIO DEL MOUSE SUGLI ELEMENTI */
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
            margin-bottom: 20px;
            margin-top: 100px;
            margin-left: 20px;
            border-collapse: collapse;
            width: 97%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {background-color: #f2f2f2;}
        div #img {
            width: 80px;
            height:80px;
            background-repeat: no-repeat;
            background-size: contain;
            border-radius:50%;
        }

        #new{
            text-align: center;
            border: 3px solid #cc977b;
            border-radius: 25px;
            padding: 15px;
            width: 300px;
            margin: auto;
        }

    </style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



<!-- mi richiamo la tipologia e l'array dei dolci di quella tipologia-->
<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
    DolciDAO dolciDAO = new DolciDAO();
    ArrayList<Dolci> dolci ;
    dolci=dolciDAO.selectAllDolci();
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
    <a href="views/mostraOrdiniUtente.jsp" class="right">VISUALIZZA ORDINI <i class="fas fa-list"></i></a>
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
<div style="overflow-x:auto;">
    <table>
        <tr>
            <th>Elimina dolce</th>
            <th>Immagine</th>
            <th>Nome dolce</th>
            <th>Prezzo (cadauno)</th>
            <th>Descrizione</th>
            <th>Modifica dolce</th>
        </tr>
        <%for(Dolci dolce : dolci) {
            String immagine = dolce.getCover();
        %>
        <tr class="text-center">
            <td class="product-remove">
                <form action="../ServletEliminaProdotto" method="get">
                    <input type="hidden" name="codiceDolce" value=<%=dolce.getCodice()%> ><button type="submit"><i class="far fa-trash-alt" style="cursor: pointer; color: black"></i></button></form>
            <td class="image-prod"><div id="img" style="background-image: url(<%="../"+immagine%>);"></div> </td>
            <td class="product-name"><%=dolce.getNome()%></td>
            <td><%=dolce.getPrezzoAlKg()+"€"%></td>
            <td class="descrizione"><%=dolce.getDescrizione()%></td>
            <td class="product-remove"><form action="ModificaDolceAdmin.jsp" method="get"> <input type="hidden" name="codiceDolce" value="<%=dolce.getCodice()%>"> <button type="submit" > <i class="fas fa-pencil-alt" style="cursor: pointer; color: black"></i></button></form></td>
        </tr> <% } %>
    </table>

    <div id="new">
    <p class="new">VUOI INSERIRE UN NUOVO DOLCE?  <a href="CreaDolce.jsp"> CREA!</a></p>
    </div>
<%}%>
</body>
</html>