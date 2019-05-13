<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 22.04.2019
  Time: 12:51
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create new Order</title>

    <asset:stylesheet src="style.css"/>
</head>

<body>

<form class="form-horizontal" style="width: 50%">
    <fieldset>

        <!-- Form Name -->
        <legend>Create a new Order</legend>

        <label>Order number: </label>
        <label>${order.orderNumber}</label>

        <div style="border-color: #0c5460; border-width: 2px">
            <p>Add a new reservation item</p>
            <button id="foodIcon" class="" onClick=""><asset:image src="/newOrder/platter.png" class="food-icon"/></button>
            <button id="bevIcon" class="" onClick=""><asset:image src="/newOrder/juice.png" class="food-icon"/></button>
        </div>

        <!-- Save Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
            <div class="col-md-4">
                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Button</button>
            </div>
        </div>

    </fieldset>
</form>

<div id="foodItemForm" class="">
        <g:form controller="orderItem" action="saveFood">
            <legend>Create food item</legend><br>
            <div style="float: left">
                <label>Select dish:</label><br>
                <g:select name="dish" from="${dishes}" value="${dish}" optionValue="name"/>
            </div>
            <div style="float: left">
                <label>Quantity:</label><br>
                <g:field type="number" name="quantity" value="${qty}"/>
            </div>
            <div>
                <g:submitButton name="Save"></g:submitButton>
            </div>
        </g:form>
</div>
<br>

<div id="beverageItemForm" class="">
        <g:form controller="orderItem" action="saveBeverage">
            <legend>Create beverage item</legend><br>
            <div style="float: left">
                <label>Select beverage:</label><br>
                <g:select name="beverage" from="${beverages}" value="${beverage}" optionValue="name"/>
            </div>
            <div style="float: left">
                <label>Quantity:</label><br>
                <g:field type="number" name="quantity" value="${qty}"/>
            </div>
            <div>
                <g:submitButton name="Save"></g:submitButton>
            </div>
        </g:form>
</div>

<div>
    <div>
        <g:if test="${items.size() != 0}">
            <h2>Current items:</h2>
            <g:each var="item" in="${items}">
                ${item.quantity}${item.dish}${item.beverage}${item.amount}
            </g:each>
        </g:if>


    </div>
</div>

</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<script>
    $("#qty").on('change', function (val) {
        if ($("#item-typ").val() == "Food") {
            console.log(val)
            calculateAmount($("#dish").val());
        }
        else calculateAmount($("#beverage").val());
        function calculateAmount(arg){
            $("#amount").text(val * arg);
        }
    });

    /*$("#newItem").on("click", function () {
        $("#itemRows").html('<g:render template="newItem"/>');
    });*/

</script>
</html>