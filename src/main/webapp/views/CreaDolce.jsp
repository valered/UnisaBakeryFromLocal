<%@ page import="model.Tipologia.TipologiaDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Tipologia.Tipologia" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arsenal, sans-serif;
            background: radial-gradient(#cc977b, #b77653);
        }

        form {
            background-color: #a0562b;
            border: 3px solid #b77653;
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

        input[type=text] {               /* Per le caselle di input*/
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 3px solid #f1f1f1;
            box-sizing: border-box;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }


        .registerbtn {                     /* bottone crea*/
            background-color: #873600;
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
            color: #873600;  /* per i link*/
        }


    </style>
</head>
<body>
<% TipologiaDAO tipologiaDAO = new TipologiaDAO();
ArrayList<Tipologia> listTipologia= tipologiaDAO.selectAllTipologia();
%>

<form action="../ServletCreaProdotto" method="post">
    <div class="container">
        <h1>Crea Dolce</h1>

        <hr>

        <label for="nome"><b>Nome</b></label>
        <input type="text" placeholder="Inserire nome dolce" name="nome" id="nome" required>

        <label for="codice"><b>Codice Dolce</b></label>
        <input type="text" placeholder="Inserire codice dolce" name="codice" id="codice" required>

        <label for="descrizione"><b>Descrizione</b></label>
        <input type="text" placeholder="Inserire descrizione dolce" name="descrizione" id="descrizione" required>

        <label for="cottura"><b>Temperature cottura</b></label>
        <input type="text" placeholder="Inserire temperatura cottura" name="cottura" id="cottura" required>

        <label for="Tconservazione"><b>Temperature conservazione</b></label>
        <input type="text" placeholder="Inserire temperatura conservazione" name="Tconservazione" id="Tconservazione" required>

        <label for="prezzoKg"><b> Prezzo al kg:</b></label>
        <input type="text" placeholder="Inserire prezzo al kg" name="prezzoKg" id="prezzoKg" required>

        <label for="peso"><b>Peso</b></label>
        <input type="text" placeholder="Inserire il peso" name="peso" id="peso" required>

        <label for="cover"><b>Inserire cover</b></label>
        <input type="text" placeholder="Inserire percorso immagine" name="cover" id="cover" required>

        <p>Selezionare tipologia</p>
        <input type="radio" id="9876" name="tipologia" value="9876">
       <label for="9876">BISCOTTI</label><br>
       <input type="radio" id="15678" name="tipologia" value="15678">
       <label for="15678">TORTE</label><br>
       <input type="radio" id="98754" name="tipologia" value="98754">
       <label for="98754">DOLCI DELLE FESTE</label>

        <hr>

        <button type="submit" class="registerbtn">Crea</button>
    </div>

</form>

</body>
</html>