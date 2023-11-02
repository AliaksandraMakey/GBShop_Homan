//
//  ProductTestsModel.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

// MARK: - Product Tests Model
struct ProductTestsModel {
    // MARK: - Properties
    var requestFactory: RequestFactory!
    var idProduct: Int!
    var pageNumber: Int!
    var idCategory: Int!
    // creating model for tests Product
    func createModelForProductCatalog() -> ProductTestsModel {
        return ProductTestsModel(requestFactory: requestFactory, pageNumber: pageNumber, idCategory: idCategory)
    }
    func createModelForProduct() -> ProductTestsModel {
        return ProductTestsModel(requestFactory: requestFactory, idProduct: idProduct)
    }
}
