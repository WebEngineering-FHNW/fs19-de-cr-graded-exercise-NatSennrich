package webec

import grails.testing.gorm.DataTest
import spock.lang.Specification

class BeverageProductSpec extends Specification implements DataTest {

    void setupSpec() {
        mockDomain BeverageProduct
    }

    void "test basic create Beverage Product"() {
        setup:
        new BeverageProduct(name: "Coca Cola", category: "soda", container: "glass bottle", price: 25.00).save()
        new BeverageProduct(name: "Rivella", category: "soda", container: "glass bottle", price: 25.00).save()

        expect:
        BeverageProduct.count() == 2
    }
}
