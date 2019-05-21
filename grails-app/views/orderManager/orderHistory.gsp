<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 17.05.2019
  Time: 17:14
--%>
<g:applyLayout name="header">
    <div class="container-fluid">
        <h4 class="mt-lg-4">Order's history for ${date}</h4>

        <div class="input-group col-lg-4 mt-lg-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Select another date</span>
            </div>
            <input type="text" id="date" class="form-control">
        </div>

        <div class="row">
            <div class="container col m-lg-3 bg-light">
                <h4 class="mt-lg-4">Open orders</h4>
                <g:if test="${openOrders.size() == 0}">
                    <div>There is any open order for this date</div>
                </g:if>
                <g:else>
                    <ul id="openOrders">
                        <g:each in="${openOrders}" var="order">
                            <li value="${order.tableNumber}"
                                class="card card-body mt-lg-2">Table: ${order.tableNumber}, Current amount: ${order.orderAmount}, Created by: ${order.user.username}</li>
                        </g:each>
                    </ul>
                </g:else>
            </div>

            <div class="container col m-lg-3 bg-light">
                <h4 class="mt-lg-4">Paid/Closed orders</h4>
                <g:if test="${paidOrders.size() == 0}">
                    <div>There is any paid order for this date</div>
                </g:if>
                <g:else>
                    <ul id="paidOrders">
                        <g:each in="${paidOrders}" var="order">
                            <li value="${order.tableNumber}"
                                class="card card-body mt-lg-2">Table: ${order.tableNumber}, Total amount: ${order.orderAmount}, Created by: ${order.user.username}</li>
                        </g:each>
                    </ul>
                </g:else>
            </div>

            <div class="container col m-lg-3 bg-light">
                <h4 class="mt-lg-4">Annulled orders</h4>
                <g:if test="${annulledOrders.size() == 0}">
                    <div>There is any annulled order for this date</div>
                </g:if>
                <g:else>
                    <ul id="paidOrders">
                        <g:each in="${annulledOrders}" var="order">
                            <li value="${order.tableNumber}"
                                class="card card-body mt-lg-2">Table: ${order.tableNumber}, Total amount: ${order.orderAmount}, Deleted by: ${order.user.username}</li>
                        </g:each>
                    </ul>
                </g:else>
            </div>
        </div>
    </div>
    <content tag="scriptsInHeaderLayout">
        <g:javascript>
            $('#date').datepicker({
                dateFormat: "dd.mm.yy",
                onSelect: function (date) {
                    location.href = "orderHistory?date=" + date;
                }
            });
        </g:javascript>
    </content>
</g:applyLayout>