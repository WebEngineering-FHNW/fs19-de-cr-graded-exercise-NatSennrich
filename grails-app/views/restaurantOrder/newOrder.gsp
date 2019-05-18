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
</head>

<body>

<g:applyLayout name="tableOverview">
    <div class="container border col m-lg-5">
        <h4 class="mt-lg-4">Create/edit order</h4>

        <label>Order number:</label>
        <label>${order.orderNumber}</label>

        <div class="container-fluid row">
            <div class="my-auto">
                Add a new reservation item
            </div>

            <div class="align-middle">
                <ul id="itemIcons">
                    <li value="1"><asset:image src="/newOrder/platter.png" class="food-icon img-thumbnail"/></li>
                    <li value="2"><asset:image src="/newOrder/juice.png" class="food-icon img-thumbnail"/></li>
                </ul>
            </div>
        </div>
        <br><br>

        <div id="foodProductForm" class="d-none">
            <g:form controller="orderItem" action="saveFood">
                <h6>Create food item</h6>

                <div class="row">
                    <g:hiddenField name="order" value="${order.orderNumber}"/>
                    <div class="form-group col-md-6">
                        <label for="foodSelect">Select dish:</label>
                        <g:select id="foodSelect" name="dish" class="form-control" from="${dishes}" optionKey="id"
                                  optionValue="name"/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="foodQty">Quantity:</label><br>

                        <div class="row">
                            <div class="col-md-6">
                                <g:field type="number" id="foodQty" name="quantity" class="form-control" required=""
                                         min="1"
                                         value="${qty}"/>
                            </div>

                            <div class="col-md-6">
                                <g:submitButton name="Save" class="btn btn-default"></g:submitButton>
                            </div>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>

        <div id="beverageProductForm" class="d-none">
            <g:form controller="orderItem" action="saveBeverage">
                <h6>Create beverage item</h6>

                <div class="row">
                    <g:hiddenField name="order" value="${order.orderNumber}"/>
                    <div class="form-group col-md-6">
                        <label for="beverageSelect">Select beverage:</label><br>
                        <g:select id="beverageSelect" name="beverage" class="form-control" from="${beverages}"
                                  optionKey="id"
                                  optionValue="name"/>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="beverageQty">Quantity:</label><br>

                        <div class="row">
                            <div class="col-md-6">
                                <g:field type="number" id="beverageQty" name="quantity" class="form-control" required=""
                                         min="1"
                                         value="${qty}"/>
                            </div>

                            <div class="col-md-6">
                                <g:submitButton name="Save" class="btn btn-default"></g:submitButton>
                            </div>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>


        <div>
            <g:if test="${items.size() != 0}">
                <h2>Current items:</h2>

                <table class='table table-hover'>
                    <tr>
                        <th>Quantity</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th></th>
                    </tr>

                    <g:findAll in="${items}" expr="it.dish != null">
                        <tr>
                            <td>${it.quantity}</td>
                            <td>${it.dish.name}</td>
                            <td>${it.amount}</td>
                            <td>
                                <g:form controller="orderItem">
                                    <g:hiddenField name="order" value="${order.orderNumber}"/>
                                    <g:hiddenField name="item" value="${it.id}"/>
                                    <g:actionSubmit action="deleteItem" value="x" class="btn btn-danger fa fa-trash"/>
                                </g:form>
                            </td>
                        </tr>
                    </g:findAll>
                    <g:findAll in="${items}" expr="it.beverage != null">
                        <tr>
                            <td>${it.quantity}</td>
                            <td>${it.beverage.name}</td>
                            <td>${it.amount}</td>
                            <td>
                                <g:form controller="orderItem">
                                    <g:hiddenField name="order" value="${order.orderNumber}"/>
                                    <g:hiddenField name="item" value="${it.id}"/>
                                    <g:actionSubmit action="deleteItem" value="x" class="btn btn-danger fa fa-trash"/>
                                </g:form>
                            </td>
                        </tr>
                    </g:findAll>
                </table>

                <h2>Total Amount: ${order.orderAmount}</h2>
            </g:if>
        </div>

        <div class="btn-toolbar justify-content-between mt-lg-5" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group" role="group" aria-label="First group">
                <g:form controller="OrderManager">
                    <g:actionSubmit action="index" value="Homepage" class="btn btn-primary"/>
                </g:form>
            </div>

            <div class="btn-group" role="group" aria-label="Second group">
                <g:form controller="restaurantOrder">
                    <g:hiddenField name="order" value="${order.orderNumber}"/>
                    <g:actionSubmit action="delete" onclick="return confirm('Are you sure???')" value="Delete order"
                                    class="btn btn-danger"/>
                    <g:actionSubmit action="save" value="Pay order" class="btn btn-primary"/>
                </g:form>
            </div>
        </div>

    </div>
</g:applyLayout>


<g:javascript>
    $('#itemIcons').selectable({
        stop: function () {
            console.log($('#itemIcons .ui-selected').val());
            var value = $('#itemIcons .ui-selected').val();
            if (value == 1) showFoodForm();
            else showBeverageForm();
        }
    });

    function showFoodForm() {
        console.log("theoretisch ja");
        $('#foodProductForm').removeClass('d-none');
        $('#beverageProductForm').addClass('d-none');
    }

    function showBeverageForm() {
        console.log("bev");
        $('#beverageProductForm').removeClass('d-none');
        $('#foodProductForm').addClass('d-none');
    }

    $('#selectableTables li[value="'+${order.tableNumber}+'"]').addClass('currentTable');
</g:javascript>

</body>
</html>