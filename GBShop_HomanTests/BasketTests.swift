//
//  BasketTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 08/06/2023.
//


import XCTest
import Alamofire
@testable import GBShop_Homan

class BasketTests: XCTestCase {

    let expectation = XCTestExpectation(description: "Testing of shopping cart methods")
    var requestFactory: RequestFactory!
    var idUser: Int!
    var idProduct: Int!
    var quantity: Int!

    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 1
        quantity = 2
        idProduct = 123
    }

    override func tearDown() {
        idUser = nil
        quantity = nil
        idProduct = nil
        requestFactory = nil
    }

    func testAddToBasket() {
        let addToBasketRequest = requestFactory.makeAddToBasketRequestFatory()
        addToBasketRequest.addToBasket(idProduct: idProduct, quantity: quantity) { response in
            switch response.result {
            case .success(let addToBasketResult):
                self.checkAddToBasketResult(addToBasketResult)
                break
            case .failure(let error):
                XCTFail("BasketTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkAddToBasketResult(_ addToBasketResult: AddToBasketResult) {
        if addToBasketResult.result != 1 {
            XCTFail("BasketTests: wrong response from server")
        }
    }

    func testDeleteFromBasket() {
        let deleteFromBasketRequest = requestFactory.makeDeleteFromBasketRequestFatory()
        deleteFromBasketRequest.deleteFromBasket(idProduct: idProduct) { response in
            switch response.result {
            case .success(let deleteFromBasketResult):
                self.checkDeleteFromBasketResult(deleteFromBasketResult)
                break
            case .failure(let error):
                XCTFail("ReviewsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkDeleteFromBasketResult(_ deleteFromBasketResult: DeleteFromBasketResult) {
        if deleteFromBasketResult.result != 1 {
            XCTFail("BasketTests: wrong response from server")
        }
    }

    func testGetBasket() {
        let getBasketRequest = requestFactory.makeGetBasketRequestFatory()
        getBasketRequest.getBasket(idUser: idUser) { response in
            switch response.result {
            case .success(let getBasketResult):
                self.checkGetBasketResult(getBasketResult)
                break
            case .failure(let error):
                XCTFail("BasketTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkGetBasketResult(_ getBasketResult: GetBasketResult) {
        if getBasketResult.amount > 0 && getBasketResult.countGoods == 0 {
            XCTFail("BasketTests: there is no product in the basket, but the price is indicated")
        }

        if getBasketResult.countGoods != getBasketResult.products.count {

            XCTFail("BasketTests: quantity of goods is not equal to number of goods descriptions")
        }

        for product in getBasketResult.products {
            if product.productID <= 0 {
                XCTFail("BasketTests: productID is not valid")
            }
            if product.productName.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {

                XCTFail("BasketTests: productName is not valid")
            }
            if product.quantity <= 0 {

                XCTFail("BasketTests: quantity of products (\(product.productID): \(product.productName)) incorrect")
            }
        }
    }
}
