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
    var pageNumber: Int!
    var idCategory: Int!

    override func setUp() {
        requestFactory = RequestFactory()
        pageNumber = 1
        idCategory = 1
    }

    override func tearDown() {
        requestFactory = nil
        pageNumber = nil
        idCategory = nil
    }

    func testGetProductCatalog() {
        let catalogData = requestFactory.makeCatalogDataRequest()
        catalogData.getCatalogData(pageNumber: pageNumber, idCategory: idCategory) { response in
            switch response.result {
            case .success(let catalog):
                self.checkCatalogDataResult(catalog)
                break
            case .failure(let error):
                XCTFail("CatalogDataTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkCatalogDataResult(_ catalog: CatalogDataResult) {
        if catalog.pageNumber < 0 {
            XCTFail("CatalogDataTests: incorrect page")
        }
        if catalog.products.count == 0 {
            XCTFail("CatalogDataTests: empty list of products")
        }
    }
}
