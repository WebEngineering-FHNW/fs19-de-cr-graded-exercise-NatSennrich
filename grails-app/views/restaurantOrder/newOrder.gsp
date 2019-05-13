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

        <!-- Form Name -->
        <legend>Creating orders</legend>

        <label>Order number: </label>
        <label>${order.orderNumber}</label>

        <div style="border-color: #0c5460; border-width: 2px">
            <fieldset>
            <legend>Add a new reservation item</legend>
            <ul id="itemIcons">
                <li value="1"><asset:image src="/newOrder/platter.png" class="food-icon"/></li>
                <li value="2"><asset:image src="/newOrder/juice.png" class="food-icon"/></li>
            </ul>
            </fieldset>

        </div>
</form>

<div id="foodItemForm" class="" hidden="true">
        <g:form controller="orderItem" action="saveFood">
            <fieldset>
            <legend>Create food item</legend><br>
            <g:hiddenField name="order" value="${order.orderNumber}"/>
            <div style="float: left">
                <label>Select dish:</label><br>
                <g:select name="dish" from="${dishes}" optionKey="id" optionValue="name"/>
            </div>
            <div style="float: left">
                <label>Quantity:</label><br>
                <g:field type="number" name="quantity" required="" value="${qty}"/>
            </div>
            <div>
                <g:submitButton name="Save"></g:submitButton>
            </div>
            </fieldset>
        </g:form>
</div>

<div id="beverageItemForm" class="" hidden="true">
        <g:form controller="orderItem" action="saveBeverage">
            <fieldset>
            <legend>Create beverage item</legend><br>
            <g:hiddenField name="order" value="${order.orderNumber}"/>
            <div style="float: left">
                <label>Select beverage:</label><br>
                <g:select name="beverage" from="${beverages}" optionKey="id" optionValue="name"/>
            </div>
            <div style="float: left">
                <label>Quantity:</label><br>
                <g:field type="number" name="quantity" required="" value="${qty}"/>
            </div>
            <div>
                <g:submitButton name="Save"></g:submitButton>
            </div>
            </fieldset>
        </g:form>
</div>

<div>
    <div>
        <g:if test="${items.size() != 0}">
            <h2>Current items:</h2>

            <table class=''>
                <tr>
                    <th>Quantity</th>
                    <th>Name</th>
                    <th>Amount</th>
                </tr>

                <g:findAll in="${items}" expr="it.dish != null">
                    <tr>
                        <td>${it.quantity}</td>
                        <td>${it.dish.name}</td>
                        <td>${it.amount}</td>
                    </tr>
                </g:findAll>
                <g:findAll in="${items}" expr="it.beverage != null">
                    <tr>
                        <td>${it.quantity}</td>
                        <td>${it.beverage.name}</td>
                        <td>${it.amount}</td>
                    </tr>
                </g:findAll>
            </table>

            <h2>Total Amount: ${order.orderAmount}</h2>
        </g:if>

    </div>
</div>
</body>
<asset:stylesheet src="/jquery-ui-1.12.1/jquery-ui.min.css"/>
<asset:javascript src="/jquery-ui-1.12.1/external/jquery/jquery.js"/>
<asset:javascript src="/jquery-ui-1.12.1/jquery-ui.min.js"/>

<script>
    $( function () {
        $('#itemIcons').selectable({
            selected: function () {
                console.log($('#itemIcons .ui-selected').val());
                var value = $('#itemIcons .ui-selected').val();
                if (value === 1) showFoodForm();
                else showBeverageForm();
            }
        });
    });


    function showFoodForm() {
        $('#foodItemForm').show();
        $('#beverageItemForm').hide();
    }

    function showBeverageForm() {
        $('#beverageItemForm').show();
        $('#foodItemForm').hide();
    }

</script>
</html>