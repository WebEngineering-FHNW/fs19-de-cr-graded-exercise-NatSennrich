package webec

class RestaurantOrder {

    Integer orderNumber
    Integer tableNumber
    Date orderDate = new Date()
    Double orderAmount
    String status
    User user

    static hasMany = [orderItems: OrderItem]

    static constraints = {
        orderNumber blank: false, unique: true
        tableNumber range: 1..12
        status inList: ["open", "paid", "annulled"]
    }

}
