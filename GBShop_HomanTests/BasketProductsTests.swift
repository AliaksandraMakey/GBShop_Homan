//
//  BasketTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 08/06/2023.
//


import XCTest
import Alamofire
@testable import GBShop_Homan

class BasketProductsTests: XCTestCase {

    let expectation = XCTestExpectation(description: "Testing of shopping cart methods")
    var requestFactory: RequestFactory!
    var idUser: Int!
    var idProduct: UUID!
    var quantity: Int!

    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 1
        quantity = 2
        idProduct = UUID()
    }

    override func tearDown() {
        idUser = nil
        quantity = nil
        idProduct = nil
        requestFactory = nil
    }

    func testAddToBasket() {
        let addToBasketRequest = requestFactory.makeAddProductToBasket()
        addToBasketRequest.addProductToBasket(idProduct: idProduct, quantity: quantity) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                XCTFail("BasketProductsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testChangeQuantityProduct() {
        let changeQuantityRequest = requestFactory.makeChangeQuantityProduct()
        changeQuantityRequest.changeQuantityProduct(idProduct: idProduct, quantity: quantity) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                XCTFail("BasketProductsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteProductFromBasket() {
        let deleteProductRequest = requestFactory.makeDeleteProductFromBasket()
        deleteProductRequest.deleteProductFromBasketByID(idProduct: idProduct) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                XCTFail("BasketProductsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testGetTotalPrice() {
        let getTotalPriceRequest = requestFactory.makeGetTotalPrice()
        getTotalPriceRequest.getTotalPrice { result in
            switch result {
            case .success(let totalPrice):
                XCTAssertGreaterThan(totalPrice, 0, "BasketProductsTests: total price is not as expected")
            case .failure(let error):
                XCTFail("BasketProductsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
