package webec

class BootStrap {

    def init = { servletContext ->
        Role adminRole = Role.findOrCreateWhere(authority: Role.ADMIN).save()
        Role userRole = Role.findOrCreateWhere(authority: Role.USER).save()

        User user = new User(username: 'user', password: 'user').save(flush: true)
        User admin = new User(username: 'admin', password: 'admin').save(flush: true)

        UserRole.create(user, userRole, true)
        UserRole.create(admin, adminRole, true)

        // Plausibility check
        assert Role.count() == 2
        assert User.count() == 2
        assert UserRole.count() == 2

        FoodProduct f = new FoodProduct(name: "Parrillada", description: "Mixture of chicken, beef and pork",
                category: "specialities", price: 140.00).save()

        FoodProduct g = new FoodProduct(name: "Carne Asada", description: "Nicaragua roast beef", category: "beef", price: 100.00).save()

        BeverageProduct b = new BeverageProduct(name: "Coca Cola", category: "soda", container: "glass bottle", price: 15.00).save()

        BeverageProduct c = new BeverageProduct(name: "Victoria", category: "beer", container: "glass bottle", price: 25.00).save()

        RestaurantOrder ro1 = new RestaurantOrder(orderNumber: 1, tableNumber: 1, status: "paid", user: user, orderAmount: 155.0, serviceStart: new Date() - 1, serviceEnd: new Date() -1).save()
        RestaurantOrder ro2 = new RestaurantOrder(orderNumber: 2, tableNumber: 3, status: "open", user: user, orderAmount: 30.0, serviceStart: new Date(), serviceEnd: new Date()).save()


        OrderItem oi1 = new OrderItem(ItemTyp: "Food", quantity: 1, amount: 140.0, dish: f, restaurantOrder: ro1).save()
        OrderItem oi2 = new OrderItem(itemTyp: "Beverage", quantity: 1, amount: 15.0, beverage: b, restaurantOrder: ro1).save()
        OrderItem oi3 = new OrderItem(itemTyp: "Beverage", quantity: 2, amount: 30.0, beverage: b, restaurantOrder: ro2).save()


    }
    def destroy = {
    }
}
