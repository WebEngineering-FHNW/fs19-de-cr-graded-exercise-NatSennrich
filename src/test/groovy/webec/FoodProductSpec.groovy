package webec

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class FoodProductSpec extends Specification implements DomainUnitTest<FoodProduct> {

    void "test basic create FoodProduct"() {
        setup:
        new FoodProduct(name: "Parrillada", description: "Mixture of chicken, beef and pork",
                category: "specialities", price: 140.00).save()

        expect:
        FoodProduct.count() == 1
    }
}
