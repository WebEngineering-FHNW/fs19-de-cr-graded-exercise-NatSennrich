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
<form>
    <label>${order.orderNumber}</label>
    <select>
     <g:each in="${dishes}" var="thisDish">
         <option value="${thisDish}">${thisDish.name}</option>
     </g:each>
 </select>
 <select>
     <g:each in="${beverages}" var="thisBeverage">
         <option value="${thisDish}">${thisBeverage.name}</option>
     </g:each>
 </select>

</form>

<form class="form-horizontal" style="width: 50%">
    <fieldset>

        <!-- Form Name -->
        <legend>Create a new Order</legend>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Select Table</label>
            <div class="col-md-4">
                <select id="selectTable" name="selectTable" class="form-control">
                    <g:each in="${1..10}" var="tableId">
                        <option value="${tableId}">Table ${tableId}</option>
                    </g:each>
                </select>
            </div>
        </div>
        <br>

        <!-- Select Basic -->
        <div class="form-group">
            <div class="col-md-4">
                <button id="foodIcon" class="" onClick=""><asset:image src="/newOrder/platter.png" class="food-icon"/></button>
                <button id="bevIcon" class="" onClick=""><asset:image src="/newOrder/juice.png" class="food-icon"/></button>


                <select id="selectbasic" name="selectbasic" class="form-control">
                </select>

                <input id="qtyinput" name="qtyinput" type="number" class="">
            </div>
        </div>


        <!-- Add Item Button -->
        <div class="form-group">
            <div class="col-md-4">
                <button id="addItem" name="addItemButton" class="btn btn-primary">New Item</button>
            </div>
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
</body>

<script>
    $("#addItem")

</script>
</html>