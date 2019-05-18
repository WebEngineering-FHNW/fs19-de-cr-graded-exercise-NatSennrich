package webec

class OrderItemController {

    def deleteItem() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))
        OrderItem oi = OrderItem.findById(params.int('item'))
        oi.delete(flush: true)

        redirect controller: "restaurantOrder", action: "newOrder", params: [table: order.tableNumber]
    }

    def saveFood() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))
        FoodProduct dish = FoodProduct.findById(params.int('dish'))
        OrderItem oi1 = new OrderItem(
                itemTyp: "Food",
                quantity: params.quantity,
                dish: dish,
                amount: dish.price * params.double('quantity'),
                restaurantOrder: order).save(flush: true)

        redirect controller: "restaurantOrder", action: "newOrder", params: [table: order.tableNumber]
    }

    def saveBeverage() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))
        BeverageProduct beverage = BeverageProduct.findById(params.int('beverage'))
        OrderItem oi2 = new OrderItem(
                itemTyp: "Beverage",
                quantity: params.double('quantity'),
                beverage: beverage,
                amount: beverage.price * params.double('quantity'),
                restaurantOrder: order).save(flush: true)

        redirect controller: "restaurantOrder", action: "newOrder", params: [table: order.tableNumber]
    }

}
