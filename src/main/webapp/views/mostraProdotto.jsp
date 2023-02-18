<%@ page import="model.Dolci.Dolci" %>
<%@ page import="model.Utente.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <% Dolci dolce = (Dolci) request.getSession().getAttribute("dolce");
        Utente user = (Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();
        String home=context;
    %>
    <title>Mostra dolce: </title>

    <style>
        <%@include file="/css/menu.css"%>
        <%@include file="/css/Bottone.css"%>

        html,body{
            font-family: Arsenal, sans-serif;
            background: radial-gradient(#cc977b, #b77653) ;
        }

        .contenitore{
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
            background: radial-gradient(#cc977b, #b77653) ;
        }

        .box-immagine {
            -ms-flex: 40%; /* IE10 */
            flex: 40%;
            padding: 20px;
        }

        .box-immagine img{
            max-width: 355px;
            width: 100%;
            border: 3px solid #f1f1f1;
            margin: 25px auto;
            border-radius: 25px;
            padding: 20px 30px 30px 30px; /*  sopra destra sotto sinistra*/
            box-shadow: 0 5px 10px #cc977b;
            background: radial-gradient(#cc977b, #b77653) ;
        }

        .specifiche {
            -ms-flex: 60%; /* IE10 */
            flex: 60%;
            padding: 20px;
        }

    </style>
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
    <a href="mostraOrdiniUtente.jsp" class="right">VISUALIZZA ORDINI <i class="fas fa-list"></i></a>
    <a href="views/ModificaAreaPersonale" class="right"><%=user.getUsername()%> <i class="far fa-user"></i></a>
    <a href="VisualizzaCarrello.jsp" class="right" >CARRELLO <i class="fas fa-shopping-cart" ></i></a>
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

    <a href="views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>

</div>
<%}%> <!--------------------------- fine menù------------------------------------>

<%String link = dolce.getCover();
    System.out.println("cover in mostraProdotto: "+link);%>

<div class="contenitore">
<div class="box-immagine">
    <img src="<%=link%>"  alt="Immagine_Prodotto" style="width:100%">
</div>

<div class="specifiche">
    <h1 class="title" style="text-align: center"> <%=dolce.getNome()%> </h1>
    <p> <%=dolce.getDescrizione().toUpperCase(java.util.Locale.ROOT)%></p>
    <p> Peso: <%=dolce.getPeso()%></p>
    <p> E' necessario mantenerlo ad una temperatura di: <%=dolce.getTempoConservazione()%></p>
    <p> Prezzo al kg: <%=dolce.getPrezzoAlKg()+"€"%> </i> </p>
    <div class="classe-bottone">
        <form action="ServletAggiungiProdottoAlCarrello" method="get">
            <label  class="myLabel" for="quantita" >Inserire la quantita: </label>
            <input id="quantita" type="number" name="quantita" value = "1" min="1"><br>
            <input type="hidden" name="codiceDolce" value=<%=dolce.getCodice()%> >
            <div class="button">
                <div class="button-layer">
                    <button >Aggiungi al Carrello </button>
                </div>
            </div>
        </form>
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
</body>
</html>
