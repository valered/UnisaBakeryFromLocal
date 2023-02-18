<%@ page import="model.Utente.Utente" %><%--
  Created by IntelliJ IDEA.
  User: Martina
  Date: 13/09/2021
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> RICERCA </title>
    <style>
        html,body{
            background:radial-gradient(#cc977b, #b77653);
            height:100%;
            width:100%;
            position:relative;
            overflow:auto;
            font-family: Arsenal sans-serif;
            margin: 0;
        }

        * {
            box-sizing: border-box;
        }



        /* -------------------------STILE HEADER---------------------------------- */
        .header {
            padding: 50px;
            text-align: center;
            background-image:  url("/immagini/logo.png");


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


        .navbar a {    /* LINK BARRA DI NAVIGAZIONE */
            float: left;
            display: block;
            color: white;
            font-family: "Arsenal",sans-serif;
            font-style: normal;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        .navbar a.right {           /* ELEMENTI DELLA BARRA DI NAVIGAZIONE A DESTRA */
            float: right;
        }



        .navbar a:hover,.dropdown:hover .dropbtn {            /* PASSAGGIO DEL MOUSE SUGLI ELEMENTI */
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


        /*-------------------------- STILE FOOTER   -------------------------------------------------*/

        .footer {
            padding: 20px;
            text-align: center;
            background: #cc977b;
        }

        .footer-social-links{
            font-size: 14px;
            text-align: center;
        }
        .footer-social-links a{
            width: 25px;
            height: 25px;
            line-height: 25px !important;
            position: relative;
            margin: 0 5px;
            text-align: center;
            display: inline-block;
            color: #111;

        }
        .footer-social-links a i,
        .footer-social-links a span{
            position: relative;
            top: 2px;
            left: 1px;
        }
        .footer-social-links a:before{
            content: "";
            display: inline-block;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            border: 1px solid #111;
        }

        .footer-social-links a:hover{
            color: #fff;
        }
        .footer-social-links a:hover:before{
            background: #111;
        }

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



    </style>
    <script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>

    <%
        Utente user=(Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();
        String home=context;
    %>


</head>
<body>

<!------------------------------------ INIZIO MENU ----------------------------------------->
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
    <a href="./Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
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
        </div> -->

    <a href="./Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="../ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
</div>

</div>
<%}%> <!------------------------------------- FINE MENU E HEADER-------------------------------->

<div>
<h1 style="text-align: center">Cerca</h1>
<p style="text-align: center">Digita il nome del dolce che stai cercando: </p>
<br>
<form onsubmit="ricerca(search2.value); return false;" action="" style="margin:auto;max-width:300px">
    <input type="text" placeholder="Cosa stai cercando.." name="search2">
    <input type="submit" class="fa fa-search" value="&#xf002" style="cursor: pointer">
</form>
<br><br><br>
<table id="tabella">

</table>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function ricerca(titolo){
        let xhttp = new XMLHttpRequest()
        xhttp.open("POST", ("${pageContext.request.contextPath}/Servlet_JSON?titolo="+titolo));

        xhttp.send();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("tabella").innerHTML = ""
                $('#tabella').append('<tr>' +
                    '<th>Immagine</th>' +
                    '<th>Nome</th>' +
                    '<th>PrezzoAlKg</th>' +
                    '<th>Peso</th>' +
                    '</tr>')
                console.log(this.response);  /*STAMPA DI PROVA*/
                let result = JSON.parse(this.response)  /* converte da JSON a JavaScript*/


                for (i = 0; i < result.length; i++) {
                    console.log(result[i].nome) /*STAMPA DI PROVA*/
                        let cover = "../"+result[i].cover
                    $('#tabella tr:last').after('<tr>' +
                        '<th><div id="img" style="background-image: url('+cover+');"></div></th>' +
                        '<th>' + result[i].nome + '</th>' +
                        '<th>' + result[i].prezzoAlKg + '</th>' +
                        '<th>' + result[i].peso+ '</th>' +
                        '</tr>');
                }
            }
        }
    }
</script>

</body>
</html>


