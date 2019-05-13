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
<!-- Select Table -->
<div class="form-group">
    <label class="col-md-4 control-label">Select Table</label>

    <div class="col-md-4">
        <g:form controller="restaurantOrder" action="newOrder">
            <select id="selectTable" name="table" class="form-control">
                <g:each in="${1..10}" var="tableId">
                    <option value="${tableId}">Table ${tableId}</option>
                </g:each>
            </select>
            <g:submitButton name="Create a new Order">Create new Order</g:submitButton>
        </g:form>
    </div>
</div>
<br>


%{--<select>
     <g:each in="${dishes}" var="thisDish">
         <option value="${thisDish}">${thisDish.name}</option>
     </g:each>
 </select>
 <select>
     <g:each in="${beverages}" var="thisBeverage">
         <option value="${thisDish}">${thisBeverage.name}</option>
     </g:each>
 </select>--}%

</body>
</html>