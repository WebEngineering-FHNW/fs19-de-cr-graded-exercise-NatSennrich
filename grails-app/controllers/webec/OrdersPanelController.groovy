package webec

class OrdersPanelController {

    def index() {
        println("in index")
    }

    def newOrder(int table) {
        def dishes = FoodItem.list()
        def beverages = BeverageItem.list()

        def resOrder = RestaurantOrder.list().find({ order -> order.orderNumber == table && order.status == "open" })
        println(resOrder)
        if (resOrder == null) {
            def orderNumber = (RestaurantOrder.list()) ? RestaurantOrder.list().last().orderNumber + 1 : 1
            resOrder = new RestaurantOrder(orderNumber: orderNumber, tableNumber: table, status: "open", orderDate: new Date())
        }

        def orderItems = OrderItem.list().findAll({order -> order.restaurantOrder == resOrder})
        println(orderItems)

        [dishes: dishes, beverages: beverages, order: resOrder, items: orderItems]
    }

    ///def amountPerItem( item, int quantity)
}
