<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 14.05.2019
  Time: 13:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Table Overview</title>

    %{--    <asset:stylesheet src="application.css"/>--}%
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="/jquery-ui-1.12.1/jquery-ui.min.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/orderManager/index"><asset:image src="/asador/asador-oficial.png"
                                                                    class="logo mx-lg-4 my-lg-2"
                                                                    alt="Asador Logo"/></a>
    <h4>Restaurant El Asador - Order's Manager</h4>

    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="/OrderManager/orderHistory?date=${new Date().format("dd.MM.yyy")}"
                   class="nav-link">Reservations overview</a>
            </li>
            <li class="nav-item">
                <a href="/beverageProduct/beverageInventory" class="nav-link">Beverage Inventory</a>
            </li>
            <li class="nav-item">
                <a href="/foodProduct/foodInventory" class="nav-link">Food Inventory</a>
            </li>
        </ul>
        <button type="button" class="btn btn-outline-secondary" onclick="">Log out</button>
    </div>

</nav>

<asset:javascript src="/jquery-ui-1.12.1/external/jquery/jquery.js"/>
<asset:javascript src="/jquery-ui-1.12.1/jquery-ui.min.js"/>

<g:layoutBody/>
</body>
</html>