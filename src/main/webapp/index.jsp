<%@ page import="model.Utente.Utente" %>
<jsp:include page="views/header.jsp"/>
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
</head>

<!-- home page di visitatore e utente loggato-->
<%if(((Utente)session.getAttribute("user"))==null || !((Utente)session.getAttribute("user")).isIfAdmin()){%>

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

<!-- home page di amministratore-->
<%} else if(((Utente)session.getAttribute("user")).isIfAdmin()){%>
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