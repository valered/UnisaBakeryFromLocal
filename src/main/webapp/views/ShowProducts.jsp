<%@ page import="model.Dolci.DolciDAO" %>
<%@ page import="model.Dolci.Dolci" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Utente.Utente" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% String t= request.getParameter("tipologia");
        if(t.equals("*")){
            t="Dolci";
        }
    %>
<title> <%=t%></title>
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

.column {
float: left;
width: 25%;
padding: 10px 10px;

}

.row {
    margin: 0 -5px;

}

.row:after {
content: "";
display: table;
clear: both;
}

@media screen and (max-width: 600px) {
.column {
width: 100%;
display: block;
margin-bottom: 20px;
}
}
    .product-card{
        <!--max-width: 355px;-->
        width: 800px;
        height: 650px;
        border: 3px solid #f1f1f1;
        margin: 25px auto;
        border-radius: 25px;
        padding: 20px 30px 30px 30px; /*  sopra destra sotto sinistra*/
        box-shadow: 0 5px 10px #cc977b;
        background: radial-gradient(#cc977b, #b77653) ;
    }

.price {
color: #000000;
font-size: 22px;
}

    .card button:hover {
        opacity: 0.7;
    }


    .product-card .button{
        position: relative;
        height: 50px;
        width: 100%;
        border-radius: 25px;
        margin-top: 30px;
        overflow: hidden;
    }
    .product-card .button .button-layer{
        position: absolute;
        height: 100%;
        width: 300%;
        left: -100%;
        background-image: linear-gradient(135deg, #cc977b, #b77653, #a0562b, #873600);
        transition: all 0.4s ease;    /*tempo di transizione*/
        border-radius: 25PX;
    }
    .product-card .button:hover .button-layer{
        left: 0;
    }
    .product-card .button button{
        position: relative;
        height: 100%;
        width: 100%;
        background: none;
        outline: none;
        border: none;
        font-size: 18px;
        font-weight: 600;
        letter-spacing: 1px;
        color: #fff;
    }


    /* -------------------------STILE HEADER---------------------------------- */
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


    .navbar a {
        float: left;
        display: block;
        color: white;
        font-family: "Arsenal",sans-serif;
        font-style: normal;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }


    .navbar a.right {
        float: right;
    }



    .navbar a:hover,.dropdown:hover .dropbtn {
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

</style>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">



<!-- mi richiamo la tipologia e l'array dei dolci di quella tipologia-->
<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
    String tipologia = request.getParameter("tipologia");
    DolciDAO dolciDAO = new DolciDAO();
    ArrayList<Dolci> dolci ;
    if(tipologia.equals("*")){
        dolci=dolciDAO.selectAllDolci();
    }
    else{
        dolci=dolciDAO.cercaDolciPerTipologia(tipologia);
    }%>

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

    <a href="Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="../ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>

</div>

<%}%>






<!-- ELENCO PRODOTTI-->
<div class="container">
<div class="row">

<%
    if(dolci!= null)
        for (Dolci e : dolci) { %>
<div class="column" >
<div class="product-card">


<img src="<%="../"+e.getCover()%>" alt="Immagine_Prodotto" style="width:100%">
<h3><%= e.getNome()%></h3>
<p class="price">Prezzo al kg: €<%=e.getPrezzoAlKg()%>
</p>

    <div class="button">
        <div class="button-layer">
            <form action="../ServletAggiungiProdottoAlCarrello" method="get">
                <input type="hidden" name="codiceDolce" value=<%=e.getCodice()%> >
                <input type="hidden" name="quantita" value="1">
                <button >Aggiungi al Carrello </button>
            </form>
        </div>
    </div>


<div class="button">
    <div class="button-layer">
        <form action="../ServletMostraProdotto" method="get"> <button id="prodotto" name="codice" value="<%=e.getCodice()%>">Visualizza Prodotto</button> </form>
    </div>
</div>

</div>
</div>
<%}%>
</div>
</div>

</body>
</html>

