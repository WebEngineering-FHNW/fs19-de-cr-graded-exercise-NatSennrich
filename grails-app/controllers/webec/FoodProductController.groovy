package webec

class FoodProductController {

    def foodInventory() {
        def foodProducts = FoodProduct.list()

        [foodProducts: foodProducts]
    }

    def editFoodProduct() {
        def foodProduct = FoodProduct.findById(params.int('foodProduct'))

        [foodProduct: foodProduct]
    }

    def saveFoodProduct() {
        def foodProduct = new FoodProduct(params)
        foodProduct.save(flush: true)

        redirect controller: "foodProduct", action: "foodInventory"
    }

    def updateFoodProduct() {
        def foodProduct = FoodProduct.findById(params.int("foodProduct"))
        foodProduct.properties = params
        foodProduct.save(flush: true)

        redirect controller: "foodProduct", action: "foodInventory"
    }

    def deleteFoodProduct() {
        def foodProduct = FoodProduct.findById(params.int("foodProduct"))
        foodProduct.delete(flush: true)

        redirect controller: "foodProduct", action: "foodInventory"
    }

}
