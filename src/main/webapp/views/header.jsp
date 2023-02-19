<%@ page import="model.Utente.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    Utente user=(Utente) request.getSession().getAttribute("user");
    String context = request.getContextPath();
    String home=context;
%>

<script src="https://kit.fontawesome.com/aafa5f65fa.js" crossorigin="anonymous"></script>
<!-- visitatore (non loggato)-->
<%if(user==null){%>
<div class="header">
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
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="${pageContext.request.contextPath}/views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a class="right"> <div class="dropdown" >
        <form action="${pageContext.request.contextPath}/ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
    <a href="./mostraOrdiniUtente.jsp" class="right">VISUALIZZA ORDINI <i class="fas fa-list"></i></a>
    <a href="./ModificaAreaPersonale.jsp" class="right"><%=user.getUsername()%> <i class="far fa-user"></i></a>
    <a href="./VisualizzaCarrello.jsp" class="right" >CARRELLO <i class="fas fa-shopping-cart" ></i></a>
</div>


<!-- amministratore-->
<%}else if(user.isIfAdmin()) {%>
<div class="header" style="background-image:url(/immagini/logo.png)">
    <img src="immagini/Senzanome.png" border="0" class="responsive-image">
</div>
<div class="navbar">
    <a href="<%=home%>">HOME <i class="fas fa-home"></i></a>
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=Biscotti">BISCOTTI <i class="fas fa-cookie"> </i></a>
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=Torta">TORTE <i class='fas fa-cheese'></i> </a>
    <a href="${pageContext.request.contextPath}/views/ShowProducts.jsp?tipologia=*">DOLCI</a><i class="fas fa-pie"></i>
    <a href="${pageContext.request.contextPath}/views/Ricerca.jsp"><button type="submit"><i class="fa fa-search"></i></button></a>
    <a href="#">BENVENUTO AMMINISTRATORE: <%=user.getUsername()%></a>
    <a class="right"> <div class="dropdown" >
        <form action="${pageContext.request.contextPath}/ServletLogout" method="get"> <button class="dropbtn" le="cursor: pointer">LOGOUT <i class="fas fa-sign-in-alt"  ></i>  </button>  </form>
    </div>
    </a>
</div>

<%}%>
</body>
</html>
