//
//  ProductCatalogTest.swift
//  GBShop_HomanTests
//
//  Created by aaa on 22/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

class CatalogDataTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Testing the method of receiving product")
    
    var requestFactory: RequestFactory!
    var products: [Product]!
    
    override func setUp() {
        requestFactory = RequestFactory()
        products = [Product]()
    }
    
    override func tearDown() {
        requestFactory = nil
        products = nil
    }
    
//    func testGetProductCatalog() {
//        let catalogData = requestFactory.makeCatalogDataRequest()
//        catalogData.getCatalogData(products: products) { response in
//            switch response.result {
//            case .success(let catalog):
//                self.checkCatalogDataResult(catalog)
//                break
//            case .failure(let error):
//                XCTFail("CatalogDataTests: \(error.localizedDescription)")
//            }
//            self.expectation.fulfill()
//        }
////        wait(for: [expectation], timeout: 15.0)
//    }
    
    private func checkCatalogDataResult(_ catalog: CatalogDataResult) {
        if catalog.products.count == 0 {
            XCTFail("CatalogDataTests: empty list of products")
        }
    }
}
