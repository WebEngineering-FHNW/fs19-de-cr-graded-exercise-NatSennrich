<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 20.04.2019
  Time: 15:10
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Orders Panel</title>
</head>

<body>
<g:applyLayout name="tableOverview">
    <div class="container border col m-lg-5">
        <h2 class="mt-lg-4">Open Orders</h2>
        <ul id="openOrders">
            <g:each in="${openOrders}" var="order">
                <li value="${order.tableNumber}"
                    class="card card-body mt-lg-2">Table: ${order.tableNumber}, Current amount: ${order.orderAmount}</li>
            </g:each>
        </ul>

    </div>

</g:applyLayout>

<g:javascript>
    $("#openOrders").selectable({
        stop: function () {
            var table = $('#openOrders .ui-selected').val();
            console.log(table);
            //$.get("/restaurantOrder/newOrder", {table: table}, function( data ) {
            //  $().html( data );});
            //var link = $.get("/restaurantOrder/newOrder", {table: table});
            var link = "/restaurantOrder/newOrder?table=";
            location.href = link + table;
        }
    });

    $('#openOrders li').each(function () {
        console.log("value" + this.value);
        $('#selectableTables li[value="' + this.value + '"]').addClass('tableOccupied');
    });
</g:javascript>

</body>
</html>