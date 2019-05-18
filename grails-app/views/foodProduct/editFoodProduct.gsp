<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 18.05.2019
  Time: 16:21
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Food Product</title>
</head>

<body>
<g:applyLayout name="header">

    <div class="container p-lg-5">
        <h4>Edit Food Product</h4>
        <g:form controller="foodProduct">
            <g:hiddenField name="foodProduct" value="${foodProduct.id}"/>
            <div class="form-group">
                <label for="name${foodProduct.id}">Name of product</label>
                <input type="text" class="form-control" id="name${foodProduct.id}" name="name"
                       value="${foodProduct.name}" required>
            </div>

            <div class="form-group">
                <label for="description${foodProduct.id}">Description</label>
                <textarea type="text" class="form-control" id="description${foodProduct.id}" rows="2"
                          name="description">${foodProduct.description}</textarea>
            </div>

            <div class="form-group">
                <label for="category${foodProduct.id}">Category</label>
                <select class="form-control" id="category${foodProduct.id}" name="category"
                        value="${foodProduct.category}">
                    <option value="chicken">Chicken</option>
                    <option value="beef">Beef</option>
                    <option value="pork">Pork</option>
                    <option value="specialities">Specialities</option>
                </select>
            </div>

            <div class="form-group">
                <label for="price${foodProduct.id}">Price</label>
                <g:field type="number" id="price${foodProduct.id}" name="price" class="form-control" required=""
                         min="0D"
                         value="${foodProduct.price}"/>
            </div>

            <div class="form-group row justify-content-end">
                <g:actionSubmit action="deleteFoodProduct" value="Delete" class="btn btn-danger m-lg-2"/>
                <g:actionSubmit action="updateFoodProduct" value="Update" class="btn btn-primary m-lg-2"/>
            </div>
        </g:form>

    </div>
</g:applyLayout>
<g:javascript>
$('#category${foodProduct.id}').val("${foodProduct.category}");
</g:javascript>

</body>
</html>