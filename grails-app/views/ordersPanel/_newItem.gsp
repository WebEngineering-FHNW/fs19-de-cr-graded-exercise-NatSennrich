<div class="form-group fieldcontain">
    <div class="col-md-4 fieldcontain">
        <button id="foodIcon" class="" onClick=""><asset:image src="/newOrder/platter.png" class="food-icon"/></button>
        <button id="bevIcon" class="" onClick=""><asset:image src="/newOrder/juice.png" class="food-icon"/></button>

        <g:radioGroup id="item-typ" labels="['Food', 'Beverage']" values="['Food', 'Beverage']" name="item-typ">
            ${it.label} ${it.radio}
        </g:radioGroup>

        <g:select id="dish" name="dish" from="${webec.FoodItem.list()}" value="${dish}" optionValue="name"/>

        <g:select id="beverage" name="beverage" from="${webec.BeverageItem.list()}" value="${beverage}" optionValue="name"/>

        <g:field id="qty" type="number" name="quantity" value="${qty}"/>
        <label id="amount">-</label>
    </div>
</div>