package webec

class BeverageProductController {

    def beverageInventory() {
        def beverageProducts = BeverageProduct.list()

        [beverageProducts: beverageProducts]
    }

    def editBeverageProduct() {
        def beverageProduct = BeverageProduct.findById(params.int('beverageProduct'))

        [beverageProduct: beverageProduct]
    }

    def saveBeverageProduct() {
        def beverageProduct = new BeverageProduct(params)
        beverageProduct.save(flush: true)

        redirect controller: "beverageProduct", action: "beverageInventory"
    }

    def updateBeverageProduct() {
        def beverageProduct = BeverageProduct.findById(params.int("beverageProduct"))
        beverageProduct.properties = params
        beverageProduct.save(flush: true)

        redirect controller: "beverageProduct", action: "beverageInventory"
    }

    def deleteBeverageProduct() {
        def beverageProduct = BeverageProduct.findById(params.int("beverageProduct"))
        beverageProduct.delete(flush: true)

        redirect controller: "beverageProduct", action: "beverageInventory"
    }

}
