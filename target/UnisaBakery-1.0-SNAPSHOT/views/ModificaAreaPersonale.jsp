<%@ page import="model.Utente.Utente" %>
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
            border: 3px solid #cc977b;
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
            background-color: #cc977b;
            outline: none;
        }

        .registerbtn {                                 /* bottone registra*/
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
            color: dodgerblue;          /* per i link*/
        }


    </style>
</head>
<body>

<%
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
%>
<form action="../ServletModificaDatiPersonali" method="post">
    <div class="container">
        <h1> Modifica dati personali </h1>

        <hr>

        <label for="nome"><b>Nome</b></label>
        <input type="text" placeholder="Enter Nome" name="nome" id="nome"  value="<%=user.getNome()%>">

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

        <label for="username"><b>UserName</b></label>
        <input type="text" placeholder="Enter UserName" name="username" id="username" value="<%=user.getUsername()%>">

        <label for="citta"><b>Citta</b></label>
        <input type="text" placeholder="Enter Citta" name="citta" id="citta" value="<%=user.getCitta()%>">

        <label for="via"><b>Via</b></label>
        <input type="text" placeholder="Enter Via" name="via" id="via" value="<%=user.getCitta()%>">

        <label for="cap"><b>Cap</b></label>
        <input type="text" placeholder="Enter Cap" name="cap" id="cap" value="<%=user.getCap()%>">

        <label for="telefono"><b>Telefono</b></label>
        <input type="text" placeholder="Enter Telefono" name="telefono" id="telefono" value="<%=user.getTelefono()%>">

        <hr>

        <button type="submit" class="registerbtn">Modifica</button>
    </div>

    <div class="container signin">
        <p>ANNULLA - <a href="<%=home%>">TORNA ALLA HOME</a>.</p>
    </div>
</form>
</body>
</html>
