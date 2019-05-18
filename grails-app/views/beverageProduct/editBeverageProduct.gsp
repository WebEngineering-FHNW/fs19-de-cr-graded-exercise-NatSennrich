<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 18.05.2019
  Time: 20:00
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Beverage Product</title>
</head>

<body>
<g:applyLayout name="header">

    <div class="container p-lg-5">
        <h4>Edit Beverage Product</h4>
        <g:form controller="beverageProduct">
            <g:hiddenField name="beverageProduct" value="${beverageProduct.id}"/>
            <div class="form-group">
                <label for="name${beverageProduct.id}">Name of product</label>
                <input type="text" class="form-control" id="name${beverageProduct.id}" name="name"
                       value="${beverageProduct.name}" required>
            </div>

            <div class="form-group">
                <label for="category${beverageProduct.id}">Category</label>
                <select class="form-control" id="category${beverageProduct.id}" name="category"
                        value="${beverageProduct.category}">
                    <option value="soda">Soda</option>
                    <option value="juice">Juice</option>
                    <option value="beer">Beer</option>
                    <option value="rum">Rum</option>
                </select>
            </div>

            <div class="form-group">
                <label for="container${beverageProduct.id}">Container</label>
                <select class="form-control" id="container${beverageProduct.id}" name="container"
                        value="${beverageProduct.container}">
                    <option value="plastic bottle">Plastic bottle</option>
                    <option value="glass bottle">Glass bottle</option>
                    <option value="can">Can</option>
                </select>
            </div>

            <div class="form-group">
                <label for="price${beverageProduct.id}">Price</label>
                <g:field type="number" id="price${beverageProduct.id}" name="price" class="form-control" required=""
                         min="0D"
                         value="${beverageProduct.price}"/>
            </div>

            <div class="form-group row justify-content-end">
                <g:actionSubmit action="deleteBeverageProduct" value="Delete" class="btn btn-danger m-lg-2"/>
                <g:actionSubmit action="updateBeverageProduct" value="Update" class="btn btn-primary m-lg-2"/>
            </div>
        </g:form>

    </div>
</g:applyLayout>
<g:javascript>
$('#category${beverageProduct.id}').val("${beverageProduct.category}");
$('#container${beverageProduct.id}').val("${beverageProduct.container}");
</g:javascript>
</body>
</html>