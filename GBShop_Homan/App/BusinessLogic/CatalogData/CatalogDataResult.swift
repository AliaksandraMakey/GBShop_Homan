//
//  CatalogDataResult.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

//MARK: - Catalog Data Result
struct CatalogDataResult: Codable {
    // properties
    let pageNumber: Int
    let products: [Product]
    /// Coding Keys
    enum CatalogDataResultKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products = "products"
    }
}

