package webec

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.USER)
class OrderManagerController {

    def index() {
        def currentOrders = RestaurantOrder.findAllByStatus("open")

        currentOrders.forEach({ order ->
            if (order.orderAmount == 0.0) {
                order.delete(flush: true)
            }
        })
        currentOrders = RestaurantOrder.findAllByStatus("open")

        [openOrders: currentOrders]
    }

    def orderHistory() {
        def date = new Date().parse("dd.MM.yyy", params.date)
        def ordersFromDate = RestaurantOrder.list().findAll({ order ->
            order.serviceStart.getDate() == date.getDate() && order.serviceStart.getMonth() == date.getMonth() && order.serviceStart.getYear() == date.getYear()
        })
        def openOrders = ordersFromDate.findAll({ order -> order.status == "open" })
        def paidOrders = ordersFromDate.findAll({ order -> order.status == "paid" })
        def annulledOrders = ordersFromDate.findAll({ order -> order.status == "annulled" })

        [date: date, openOrders: openOrders, paidOrders: paidOrders, annulledOrders: annulledOrders]
    }
}
