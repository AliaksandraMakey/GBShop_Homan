//
//  ProductTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 22/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

class ProductTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Testing the method of receiving products by ID")
    var requestFactory: RequestFactory!
    var idProduct: UUID!
    
    override func setUp() {
        requestFactory = RequestFactory()
        idProduct = UUID()
    }
    
    override func tearDown() {
        requestFactory = nil
        idProduct = nil
    }
    
    func testGetProduct() {
        let productRequest = requestFactory.makeG()
        
        productRequest.getProductBy(id: idProduct) { response in
            switch response.result {
            case .success(let productResult):
                self.checkProductResult(productResult)
            case .failure(let error):
                XCTFail("ProductTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    private func checkProductResult(_ productResult: ProductResult) {
        if productResult.result != 1 {
            XCTFail("ProductTests: wrong response from server")
        }
        
        if productResult.product.name.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            XCTFail("ProductTests: Product name doesn't found")
        }
        
        if productResult.product.price <= 0 {
            XCTFail("ProductTests: the price of the product is incorrect")
        }
    }
}
