<%@ page import="model.Utente.Utente" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BAKERY</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        <%@include file="/css/menu.css"%>
        .container{background-color: #cc977b;
            border: 3px solid #b77653;
            padding: 3px;
            margin: 25px auto;
            width: 300px;}

        .card button:hover {
            opacity: 0.7;
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
            background-image: linear-gradient(135deg, #873600, #a0562b,#b77653, #cc977b);
            transition: all 0.4s ease;
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
            color: #b77653;
        }
    </style>
    <link rel="shortcut icon" href="immagini/Senzanome.png">
    <%

        Utente user=(Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();
        String home=context;
    %>

    <script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- visitatore (non loggato)-->
<%if(user==null){%>
<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="views/ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="views/ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="views/ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="views/login.jsp" class="right">LOGIN - REGISTRATI <i class="fas fa-sign-in-alt" ></i> </a>
</div>
<%}
else if(!user.isIfAdmin()){%>
<!-- utente loggato-->

<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="views/ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="views/ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="views/ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a class="right"> <div class="dropdown" >
        <form action="ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
    <a href="views/mostraOrdiniUtente.jsp" class="right">VISUALIZZA ORDINI <i class="fas fa-list"></i></a>
    <a href="views/ModificaAreaPersonale.jsp" class="right"><%=user.getUsername()%> <i class="far fa-user"></i></a>
    <a href="views/VisualizzaCarrello.jsp" class="right" >CARRELLO <i class="fas fa-shopping-cart" ></i></a>
</div>


<%}else if(user.isIfAdmin()) {%>
<!-- amministratore-->


<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="views/ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="views/ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="views/ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
   <!-- <div class="dropdown">
        <button class="dropbtn">IMPOSTAZIONI
            <i class="fas fa-user-cog"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">MODIFICA DOLCI</a>
            <a href="#">MODIFICA TIPOLOGIA</a>
            <a href="#">MODIFICA CLIENTI</a>
        </div>
    </div>-->
    <a href="views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
</div>

<div class="container">
    <div class="product-card">


    <div class="button">
    <div class= "button-layer">
    <a href="views/MostraClienti.jsp"> <button class="classe-bottone">MOSTRA CLIENTI <br><br></button></a>
    </div>
    </div>

    <div class="button">
    <div class= "button-layer">
    <a href="views/MostraOrdini.jsp"> <button class="classe-bottone">MOSTRA ORDINI<br><br></button></a>
    </div>
    </div>

     <div class="button">
     <div class= "button-layer">
     <a href="views/MostraDolci.jsp"> <button class="classe-bottone">MOSTRA DOLCI<br><br></button></a>
     </div>
     </div>


    </div>
</div>

<%}%>


<!-- home page di visitatore e utente loggato-->
<% if(user==null||!user.isIfAdmin()){%>
<div class="row">

    <div class="demo coursemeal">

        <!-- BISCOTTI-->
        <div class="coursemeal__div">

            <picture class="responsive-img">

                <img src="immagini/prodotti/BiscottiAnice.jpg" alt="HOME" >
            </picture>

            <div class="coursemeal-info">
                <a href="views/ShowProducts.jsp?tipologia=Biscotti" class="coursemeal-info__link">BISCOTTI</a>
            </div>
        </div>

        <!-- DOLCI DELLE FESTE -->
        <div class="coursemeal__div">

            <picture class="responsive-img">

                <img src="immagini/prodotti/colomba.jpg" alt="HOME" >
            </picture>

            <div class="coursemeal-info">
                <a href="views/ShowProducts.jsp?tipologia=DolciDelleFeste" class="coursemeal-info__link">DOLCI DELLE FESTE</a>
            </div>
        </div>

        <!-- TORTE-->
        <div class="coursemeal__div">

            <picture class="responsive-img">
                <img src="immagini/prodotti/sacher.jpg" alt="TORTE">
            </picture>

            <div class="coursemeal-info">
                <a href="views/ShowProducts.jsp?tipologia=Torta" class="coursemeal-info__link">TORTE</a>
            </div>
        </div>
    </div>
</div>


<div class="footer">
    <p>SEGUICI SUI NOSTRI PROFILI SOCIAL!</p>

    <div class="footer-social-links">
        <a href="#" title="Facebook" ><i class="fa fa-facebook"></i></a>
        <a href="#" title="Twitter" ><i class="fa fa-twitter"></i></a>
        <a href="#" title="Instagram" ><i class="fab fa-instagram"></i></a>
        <a href="#" title="Whatsapp"><i class="fab fa-whatsapp"></i></a>
    </div>

</div>

<%}%> <!--fine home page visitatori o utenti-->

</body>
</html>