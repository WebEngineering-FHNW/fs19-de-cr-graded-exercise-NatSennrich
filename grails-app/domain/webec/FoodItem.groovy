package webec

class FoodItem {

    String name
    String description
    String category
    double price
    Date lastUpdated = new Date()

    static constraints = {
        name blank: false
        description blank: true, maxSize: 255
        category blank: false, inList: ['chicken', 'beef', 'pork', 'specialities']
        price min: 0D
    }
}
