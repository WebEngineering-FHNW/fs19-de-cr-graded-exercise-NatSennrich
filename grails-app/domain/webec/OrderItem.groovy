package webec

class OrderItem {

    String itemTyp
    Integer quantity
    Double amount
    FoodItem dish
    BeverageItem beverage

    static belongsTo = [restaurantOrder: RestaurantOrder]

    static constraints = {
        itemTyp inList: ["Food", "Beverage"]
        quantity min: 1
        amount min: 0D
        dish nullable: true, validator: {val, item -> if(item.itemTyp == "Food") val != null}
        beverage nullable: true, validator: {val, item -> if(item.itemTyp == "Beverage") val != null}
    }
}
