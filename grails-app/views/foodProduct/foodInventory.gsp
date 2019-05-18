<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 18.05.2019
  Time: 14:42
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Food Inventory</title>
</head>

<body>
<g:applyLayout name="header">
    <div class="container p-lg-5">
        <h4 class="mb-lg-5">Food Product Inventory</h4>
        <g:form controller="foodProduct">
            <h6>Add new Food Product</h6>

            <div class="row">
                <div class="form-group col-lg-2">
                    <label for="name">Name of product</label>
                    <input type="text" id="name" class="form-control" name="name" required>
                </div>

                <div class="form-group col-lg-4">
                    <label for="description">Description</label>
                    <input type="text" id="description" class="form-control" rows="2" name="description"/>
                </div>

                <div class="form-group col-lg-2">
                    <label for="category">Category</label>
                    <select id="category" class="form-control" name="category">
                        <option value="chicken">Chicken</option>
                        <option value="beef">Beef</option>
                        <option value="pork">Pork</option>
                        <option value="specialities">Specialities</option>
                    </select>
                </div>

                <div class="form-group mx-lg-3">
                    <label for="price">Price</label>

                    <div class="form-inline">
                        <div class="form-group">
                            <g:field type="number" id="price" name="price" class="form-control mr-lg-4" required="true"
                                     min="0D"
                                     value="${price}"/>
                        </div>

                        <div class="form-group">
                            <g:actionSubmit action="saveFoodProduct" value="Add" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
        <h6>Available Food Products</h6>
        <table class='table table-hover'>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Price</th>
                <th></th>
            </tr>
            <g:each in="${foodProducts}" var="dish">
                <tr>
                    <td>${dish.name}</td>
                    <td>${dish.description}</td>
                    <td>${dish.category}</td>
                    <td>${dish.price}</td>
                    <td>
                        <g:form controller="foodProduct">
                            <g:hiddenField name="foodProduct" value="${dish.id}"/>
                            <g:actionSubmit action="editFoodProduct" value="Edit" class="btn btn-secondary"/>
                        </g:form>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</g:applyLayout>
</body>
</html>