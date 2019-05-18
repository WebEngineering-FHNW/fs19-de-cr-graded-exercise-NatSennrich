<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 18.05.2019
  Time: 19:50
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Beverage Inventory</title>
</head>

<body>
<g:applyLayout name="header">
    <div class="container p-lg-5">
        <h4 class="mb-lg-5">Beverage Product Inventory</h4>
        <g:form controller="beverageProduct">
            <h6>Add new Beverage Product</h6>

            <div class="row">
                <div class="form-group col-lg-3">
                    <label for="name">Name of product</label>
                    <input type="text" id="name" class="form-control" name="name" required>
                </div>

                <div class="form-group col-lg-2">
                    <label for="category">Category</label>
                    <select id="category" class="form-control" name="category">
                        <option value="soda">Soda</option>
                        <option value="juice">Juice</option>
                        <option value="beer">Beer</option>
                        <option value="rum">Rum</option>
                    </select>
                </div>

                <div class="form-group col-lg-3">
                    <label for="container">Container</label>
                    <select id="container" class="form-control" name="container">
                        <option value="plastic bottle">Plastic bottle</option>
                        <option value="glass bottle">Glass bottle</option>
                        <option value="can">Can</option>
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
                            <g:actionSubmit action="saveBeverageProduct" value="Add" class="btn btn-primary"/>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
        <h6>Available Beverage Products</h6>
        <table class='table table-hover'>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Price</th>
                <th></th>
            </tr>
            <g:each in="${beverageProducts}" var="beverage">
                <tr>
                    <td>${beverage.name}</td>
                    <td>${beverage.category}</td>
                    <td>${beverage.container}</td>
                    <td>${beverage.price}</td>
                    <td>
                        <g:form controller="beverageProduct">
                            <g:hiddenField name="beverageProduct" value="${beverage.id}"/>
                            <g:actionSubmit action="editBeverageProduct" value="Edit" class="btn btn-secondary"/>
                        </g:form>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</g:applyLayout>

</body>
</html>