<%@ page import="model.Utente.Utente" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Dolci.Dolci" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Cart.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Cart.CartItemDAO" %>
<jsp:include page="./header.jsp"/>
<html>
<head>
<title>CARRELLO</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="immagini/logoNEW.png">
<script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>


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



   /* -------------------------STILE MENU E HEADER---------------------------------- */
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


    .navbar a {   /* LINK BARRA DI NAVIGAZIONE */
        float: left;
        display: block;
        color: white;
        font-family: "Arsenal",sans-serif;
        font-style: normal;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }


    .navbar a.right {   /* ELEMENTI DELLA BARRA DI NAVIGAZIONE A DESTRA */
        float: right;
    }



    .navbar a:hover,.dropdown:hover .dropbtn {   /* PASSAGGIO DEL MOUSE SUGLI ELEMENTI */
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

    /* ------------------------- FINE STILE MENU E HEADER---------------------------------- */

    /*------------------------------------STILE TABELLA E "RIASSUNTO" CARRELLO---------------------*/

    .row {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        -ms-flex-wrap: wrap; /* IE10 */
        flex-wrap: wrap;
        margin: 0 -16px;
    }

    .col-25 {
        -ms-flex: 25%; /* IE10 */
        flex: 25%;
    }

    .col-50 {
        -ms-flex: 50%; /* IE10 */
        flex: 50%;
    }

    .col-25,.col-50{
        padding: 0 16px;
    }

    .container2 {
        background: radial-gradient(#cc977b, #b77653);
        padding: 5px 20px 15px 20px;
        border: 1px solid lightgrey;
        border-radius: 3px;
    }

    label {
        margin-bottom: 0px;
        display: block;

    }

    a {
        color: #873600;
    }

    hr {
        border: 1px solid lightgrey;
    }

    span.price {
        float: right;
        color: grey;
    }

    @media (max-width: 800px) {
        .row {
            flex-direction: column-reverse;
        }
        .col-25 {
            margin-bottom: 20px;
        }
    }

    @media (max-width: 600px) {
        .container1 {
            padding: 40px 40px;
        }
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

     .mylink:link, .mylink:visited {
          background-color: #a0562b;
          color: white;
          padding: 10px 20px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
      }

    .mylink:hover, .mylink:active {
        background-color: #a0562b;
        color: white;
    }
  /*-------------------------------- FINE STILE TABELLA E "RIASSUNTO" CARRELLO---------------------*/

</style>

<%
    CartItemDAO cartItemDAO=new CartItemDAO();
    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
    System.out.println(user);
%>

</head>
<body>


<!------------------------------------------ CARRELLO ------------------------------------------->
<br>
<div style="overflow-x:auto;">
    <table>
        <tr>
            <th>Rimuovi Dolce dal carrello</th>
            <th>Immagine</th>
            <th>Nome dolce</th>
            <th>Prezzo (cadauno)</th>
            <th>Quantit&#224</th>
            <th>Modifica quantit&#224</th>
            <th>Totale carrello</th>
        </tr>
        <% if(user!=null && !user.isIfAdmin()){
            ArrayList<CartItem> carrello = cartItemDAO.selectAllCartByEmail(user.getEmail());
            if(carrello != null){
                for(CartItem c: carrello) {
                    Dolci dolce= c.getDolce();
                    int quantita= c.getQuantita();
                    if(dolce!= null && quantita!=0){
                        String Nome= dolce.getNome();
                        String immagine= dolce.getCover();
                        double prezzo = dolce.getPrezzoAlKg();
                        double totale = dolce.getPrezzoAlKg()*quantita;
                        int codiceDolce= dolce.getCodice();
        %>
        <tr class="text-center">
            <td class="product-remove"><div>
                <form action="../ServletRimuoviProdotto" method="get">
                    <input type="hidden" name="codiceDolce" value=<%=dolce.getCodice()%> ><button type="submit"><i class="far fa-trash-alt" style="cursor: pointer"></i></button></form></div>
            <td class="image-prod"><div id="img" style="background-image: url(<%="../"+immagine%>);"></div> </td>
            <td class="product-name"><%=Nome%></td>
            <td><i class="fas fa-euro-sign"><%=" "+prezzo%></i></td>
            <td class="quantity"><%=quantita%></td>
            <td><form action="modificaQuantitaCarrello.jsp" method="get"> <input type="hidden" name="codiceDolce" value="<%=dolce.getCodice()%>"> <button type="submit" > <i class="fas fa-pencil-alt" style="cursor: pointer; color: black"></i></button></form></td>
            <td class="total"><i class="fas fa-euro-sign"><%=" "+totale%></i></td>
        </tr> <% } } } } %>
    </table>
<!-------------------------------------RIEPILOGO CARRELLO --------------------------------------------->
    <div class="col-25">
        <div class="container2">
            <% if(user!=null && !user.isIfAdmin()){

                ArrayList<CartItem> carrello = cartItemDAO.selectAllCartByEmail(user.getEmail());
                if(carrello != null){%>
            <h4>RIEPILOGO <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%=carrello.size()%></b></span></h4>
            <%
                double totale=0.0;
                for(CartItem c : carrello){
                    Dolci dolce= c.getDolce();
            %>
            <p><a href="#"><%=dolce.getNome()%></a> <span class="price"><%=dolce.getPrezzoAlKg()*c.getQuantita()%></span></p>
            <%
                    totale+= dolce.getPrezzoAlKg()*c.getQuantita();
                }%>
            <hr>
            <p>Total <span class="price" style="color:black"><i class="fas fa-euro-sign"><b><%=" "+ totale%></b></i></span></p>

            <form action="#" method="get">

                <div class="row">
                    <div class="col-50">
                        <%
                            if(user.getUsername()== null){
                        %>
                        <h3> EFFETTUARE IL LOGIN PER CONTINUARE </h3>
                        <li><a class="mylink" href= "ServletLogin"> Login </a></li>
                        <%}%>

                        <h3>DATI DI SPEDIZIONE</h3>
                        <label for="name"><i class="fa fa-user"></i> Nome</label>
                        <input type="text" id="name" name="name" placeholder="Mario Rossi" ><br><br>
                        <label for="email"><i class="fa fa-envelope"></i> Email</label>
                        <input type="text" id="email" name="email" placeholder="mariorossi@email.com"><br><br>
                        <label for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
                        <input type="text" id="adr" name="address" placeholder=" via dei Pini"><br><br>
                        <label for="city"><i class="fa fa-institution"></i> Citt&#224 </label>
                        <input type="text" id="city" name="city" placeholder="Roma"><br><br>
                        <label for="prov">Provincia</label>
                        <input type="text" id="prov" name="prov" placeholder="RM"><br><br>
                        <label for="cap">Cap</label>
                        <input type="text" id="cap" name="cap" placeholder="00031"><br>
                        <br><br>
                    </div>
                </div>
            </form>

            <form action="../ServletOrdine" method="get">
                <button type="submit"> Acquista</button>
            </form>
            <%}}else{%>
            <h4>Il carrello &#232 vuoto</h4>
            <%}%>

        </div>

    </div>

</div>
</body>
</html>
