<%@ page import="model.Utente.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modifica quantita carrello</title>
    <style>
        body {
            font-family: Arsenal, sans-serif;
            background: radial-gradient(#cc977b, #b77653);
        }

        form {
            background-color: #cc977b;
            border: 3px solid #f1f1f1;
            margin: 25px auto;
            width: 270px;

        }

        * {
            box-sizing: border-box;
        }
        .container {
            padding: 3px;
            margin: 0 auto;
            width: 250px;

        }


        input[type=text], input[type=password],input[type=email] {    /* Per le caselle di input*/
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 3px solid #cc977b;
            box-sizing: border-box;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        .registerbtn {                                 /* bottone registra*/
            background-color: #b77653;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .registerbtn:hover {
            opacity: 1;
        }


        a {
            color: #873600;          /* per i link*/
        }


    </style>
</head>
<body>

<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
%>
<form action="../ServletModificaQuantitaCarrello" method="get">
    <div class="container">
        <h1> Modifica quantita carrello </h1>


        <hr>

        <label for="nuova" >Inserire la quantita: </label>
        <input id="nuova" type="number" name="nuova" value = "1" min="1"><br>
        <input type="hidden" name="codiceDolce" value="<%=request.getParameter("codiceDolce")%>">
        <hr>

        <button type="submit" class="registerbtn">Modifica</button>
    </div>

    <div class="container signin">
        <p>ANNULLA - <a href="VisualizzaCarrello.jsp">TORNA AL CARRELLO</a>.</p>
    </div>
</form>
</body>
</html>
