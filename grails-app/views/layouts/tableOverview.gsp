<%--
  Created by IntelliJ IDEA.
  User: Norberto Sennrich
  Date: 14.05.2019
  Time: 16:53
--%>
<g:applyLayout name="header">

    <div class="container-fluid">
        <div class="row">
            <div class="container col m-lg-5 bg-light">
                <h4 class="mt-lg-4">Select a table to create/manage order</h4>
                <ol id="selectableTables">
                    <g:each in="${1..12}" var="index">
                        <li class="ui-state-default" value="${index}">Table:<br>${index}</li>
                    </g:each>
                </ol>
            </div>
            <g:layoutBody/>
        </div>
    </div>

    <content tag="tableOverviewScript">
        <g:javascript>
            $('#selectableTables').selectable({
                stop: function () {
                    var table = $('#selectableTables .ui-selected').val();
                    location.href = "/restaurantOrder/newOrder?table=" + table;
                }
            });
        </g:javascript>

        <g:pageProperty name="page.otherScripts"/>
    </content>
</g:applyLayout>