<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 20.04.2019
  Time: 15:10
--%>
<g:applyLayout name="tableOverview">
    <div class="container border col m-lg-5">
        <h2 class="mt-lg-4">Open Orders</h2>
        <ul id="openOrders">
            <g:each in="${openOrders}" var="order">
                <li class="card card-body mt-lg-2"
                    value="${order.tableNumber}">Table: ${order.tableNumber}, Current amount: ${order.orderAmount}</li>
            </g:each>
        </ul>

    </div>

    <content tag="otherScripts">
        <g:javascript>
            $("#openOrders").selectable({
                stop: function () {
                    var table = $('#openOrders .ui-selected').val();
                    var link = "/restaurantOrder/newOrder?table=";
                    location.href = link + table;
                }
            });

            $('#openOrders li').each(function () {
                $('#selectableTables li[value="' + this.value + '"]').addClass('tableOccupied');
            });
        </g:javascript>
    </content>

</g:applyLayout>
