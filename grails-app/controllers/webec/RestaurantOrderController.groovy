package webec

class RestaurantOrderController {

    //static scaffold = RestaurantOrder

    def newOrder(int table) {
        def dishes = FoodItem.list()
        def beverages = BeverageItem.list()

        def resOrder = RestaurantOrder.list().find({ order -> order.tableNumber == table && order.status == "open" })

        if (resOrder == null) {
            def orderNumber = (RestaurantOrder.list()) ? RestaurantOrder.list().last().orderNumber + 1 : 1
            resOrder = new RestaurantOrder(
                    orderNumber: orderNumber,
                    tableNumber: table,
                    status: "open",
                    user: User.first(),
                    orderAmount: 0.0,
                    orderDate: new Date()).save()
        }

        def orderItems = OrderItem.list().findAll({order -> order.restaurantOrder == resOrder})

        def currentAmount = orderItems.sum {it.amount}

        resOrder.orderAmount = currentAmount
        resOrder.save()

        [dishes: dishes, beverages: beverages, order: resOrder, items: orderItems]
    }

}
