package webec

import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class OrderManagerControllerSpec extends Specification implements ControllerUnitTest<OrderManagerController>, DataTest {

    def setupSpec() {
        mockDomain RestaurantOrder
        mockDomain User
    }

    void "test index when orderAmount is 0"() {
        setup:
        def user = new User(username: "user", password: "user" ).save()
        new RestaurantOrder(orderNumber: 1, tableNumber: 1, status: "open", user: user).save()

        when:
        def model = controller.index()

        then:
        status == 200
        model.openOrders.size() == 0
    }

    void "test index and receive an order"() {
        setup:
        def user = new User(username: "user", password: "user" ).save()
        new RestaurantOrder(orderNumber: 1, tableNumber: 1, status: "open", orderAmount: 140.0, user: user).save()

        when:
        def model = controller.index()

        then:
        status == 200
        model.openOrders.size() == 1
        model.openOrders.get(0).status == "open"
        model.openOrders.get(0).orderAmount == 140.0
    }

    void "test orderHistory with 3 different status orders"() {
        setup:
        def user = new User(username: "user", password: "user" ).save()
        new RestaurantOrder(orderNumber: 1, tableNumber: 1, status: "open", orderAmount: 140.0, user: user).save()
        new RestaurantOrder(orderNumber: 2, tableNumber: 1, status: "paid", orderAmount: 240.0, user: user).save()
        new RestaurantOrder(orderNumber: 3, tableNumber: 1, status: "annulled", orderAmount: 340.0, user: user).save()

        when:
        params['date'] = new Date().format("dd.MM.yyy")
        def model = controller.orderHistory()

        then:
        status == 200
        model.openOrders.size() == 1
        model.paidOrders.size() == 1
        model.annulledOrders.size() == 1
    }
}
