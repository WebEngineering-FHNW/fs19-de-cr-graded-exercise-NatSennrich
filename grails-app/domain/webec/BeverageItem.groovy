package webec

class BeverageItem {

    String name
    String category
    String container
    double price
    Date lastUpdated = new Date()

    static constraints = {
        name blank: false
        category blank: false, inList: ["soda", "juice", "beer", "rum"]
        container blank: false, inList: ["plastic bottle", "glass bottle", "can"]
        price min: 0D
    }
}
