package webec

class OrdersPanelController {

    def index() {
    }

    def newOrder() {
        def dishes = FoodItem.list()
        def beverages = BeverageItem.list()
        def orderNumber = (RestaurantOrder.list()) ? RestaurantOrder.list().last().orderNumber + 1 : 1

        RestaurantOrder ro1 = new RestaurantOrder(orderNumber: orderNumber, status: "open", orderDate: new Date())

        [dishes: dishes, beverages: beverages, order: ro1]
    }
}
