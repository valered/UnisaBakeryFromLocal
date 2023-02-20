<%@ page import="model.Utente.Utente" %>
<jsp:include page="./header.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WHITE WINGS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        <%@include file="/css/menu.css"%>
        .contenitore{background-color: white;
        border: 3px solid #cc977b;
        padding: 3px;
        margin: 25px auto;
        width: 250px;}
    </style>
    <link rel="shortcut icon" href="../immagini/Senzanome.png">
    <%

        Utente user=(Utente) request.getSession().getAttribute("user");
        String context = request.getContextPath();
        String home=context;
        System.out.println(user);
    %>

    <script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>
</head>
<body>



<!-- home page di visitatore e utente loggato-->
<% if(user==null||!user.isIfAdmin()){%>
<div class="row">

    <div class="demo coursemeal">

        <!-- BISCOTTI-->
        <div class="coursemeal__div ">

            <picture class="responsive-img">

                <img src="immagini/prodotti/Brutti-ma-buoni.jpg" alt="Biscotti" >
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
                <a href="views/ShowProducts.jsp?tipologia=Dolci+Pasquali" class="coursemeal-info__link">DOLCI DELLE FESTE</a>
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
<%}%> <!--fine home page visitatori o utenti-->

<!---------------- home page ADMIN --------------------------->
<% if(user.isIfAdmin()){%>
<div class="contenitore">
    <a href="views/MostraClienti.jsp"> <button class="classe-bottone">MOSTRA CLIENTI <br><br></button></a>
    <a href="views/MostraOrdini.jsp"> <button class="classe-bottone">MOSTRA ORDINI<br><br></button></a>
    <a href="views/MostraDolci.jsp"> <button class="classe-bottone">MOSTRA DOLCI<br><br></button></a>
</div>

<%}%>


<footer>
    <%@include file="./footer.jsp"%>
</footer>

</body>
</html>