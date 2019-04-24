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

<g:form controller="OrdersPanel" action="newOrder">
    <g:submitButton name="Create a new Order">Create new Order</g:submitButton>
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
</g:form>


</body>
</html>