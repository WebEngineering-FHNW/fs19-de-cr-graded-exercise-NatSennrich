package webec

class RestaurantOrderController {

    def newOrder(int table) {
        def dishes = FoodProduct.list()
        def beverages = BeverageProduct.list()
        def resOrder = RestaurantOrder.list().find({ order -> order.tableNumber == table && order.status == "open" })

        if (resOrder == null) {
            def orderNumber = (RestaurantOrder.list()) ? RestaurantOrder.list().last().orderNumber + 1 : 1
            resOrder = new RestaurantOrder(
                    orderNumber: orderNumber,
                    tableNumber: table,
                    status: "open",
                    user: User.first(),
                    orderAmount: 0.0,
                    serviceStart: new Date(),
                    serviceEnd: new Date()).save(flush: true)
        }

        def orderItems = OrderItem.list().findAll({ order -> order.restaurantOrder == resOrder })
        def currentAmount = (orderItems.size() != 0) ? orderItems.sum { it.amount } : 0.0

        resOrder.orderAmount = currentAmount
        resOrder.save(flush: true)

        [dishes: dishes, beverages: beverages, order: resOrder, items: orderItems]
    }

    def save() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))

        if (order.orderAmount != 0.0) {
            order.status = "paid"
            order.serviceEnd = new Date()
            order.save(flush: true)
        }

        redirect controller: "OrderManager", action: "index"
    }

    def delete() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))

        if (order.orderItems.size() != 0) {
            order.status = "annulled"
            order.serviceEnd = new Date()
            order.save(flush: true)
        } else order.delete(flush: true)

        redirect controller: "OrderManager", action: "index"
    }

}
