package webec

class OrderItemController {

    ///static scaffold = OrderItem
    def saveFood() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))
        FoodItem dish = FoodItem.findById(params.int('dish'))
        OrderItem oi1 = new OrderItem(
                itemTyp: "Food",
                quantity: params.quantity,
                dish: dish,
                amount: dish.price * params.double('quantity'),
                restaurantOrder: order).save()

        redirect controller:"restaurantOrder", action: "newOrder",  params: [table: order.tableNumber]
    }

    def saveBeverage() {
        RestaurantOrder order = RestaurantOrder.findByOrderNumber(params.int('order'))
        BeverageItem beverage = BeverageItem.findById(params.int('beverage'))
        OrderItem oi2 = new OrderItem(
                itemTyp: "Beverage",
                quantity: params.double('quantity'),
                beverage: beverage,
                amount: beverage.price * params.double('quantity'),
                restaurantOrder: order).save()

        redirect controller:"restaurantOrder", action: "newOrder",  params: [table: order.tableNumber]
    }

}
