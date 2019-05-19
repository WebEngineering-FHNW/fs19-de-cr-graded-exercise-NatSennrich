package webec

import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class FoodProductControllerSpec extends Specification implements ControllerUnitTest<FoodProductController>, DataTest {

    void setupSpec() {
        mockDomain FoodProduct
    }

    void "test delete FoodProduct"() {
        setup:
        new FoodProduct(name: "Parrillada", description: "Mixture of chicken, beef and pork",
                category: "specialities", price: 140.00).save()

        when:
        params['foodProduct'] = 1
        controller.deleteFoodProduct()

        then:
        FoodProduct.count() == 0
    }
}
