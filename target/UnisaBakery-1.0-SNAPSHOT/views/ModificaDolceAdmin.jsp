<%@ page import="model.Utente.Utente" %><%--
  Created by IntelliJ IDEA.
  User: Martina
  Date: 14/09/2021
  Time: 00:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Modifica dati personali: </title>
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


        input[type=text], input[type=password],input[type=email] {       /* Per le caselle di input*/
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


        .registerbtn {                                     /*bottone modifica*/
            background-color: #cc977b;
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
            color: #873600;    /* per i link*/
        }


    </style>
</head>
<body>

<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
%>
<form action="../ServletModificaProdottoAdmin" method="post">
    <div class="container">
        <h1> Modifica Prodotto</h1>

        <hr>


        <label for="descrizione"><b>Descrizione</b></label>
        <input type="text" placeholder="Inserire descrizione dolce" name="descrizione" id="descrizione" required>

        <label for="prezzoKg"><b> Prezzo al kg:</b></label>
        <input type="text" placeholder="Inserire prezzo al kg" name="prezzoKg" id="prezzoKg" required>

        <label for="peso"><b>Peso</b></label>
        <input type="text" placeholder="Inserire il peso" name="peso" id="peso" required>

        <p>Selezionare tipologia</p>
        <input type="radio" id="9876" name="tipologia" value="9876">
        <label for="9876">BISCOTTI</label><br>
        <input type="radio" id="15678" name="tipologia" value="15678">
        <label for="15678">TORTE</label><br>
        <input type="radio" id="98754" name="tipologia" value="98754">
        <label for="98754">DOLCI DELLE FESTE</label>

        <hr>

        <input type="hidden" name="codiceDolce" value="<%=request.getParameter("codiceDolce")%>">
        <button type="submit" class="registerbtn">Modifica</button>
    </div>

    <div class="container signin">
        <p>ANNULLA - <a href="../index.jsp">TORNA ALLA HOME</a>.</p>
    </div>
</form>
</body>
</html>