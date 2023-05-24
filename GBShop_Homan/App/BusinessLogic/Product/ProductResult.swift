//
//  ProductResult.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

//MARK: - Product Result
struct ProductResult: Codable {
    // properties
    let result: Int
    let name: String
    let price: Int
    let description: String
    /// Coding Keys
    enum ProductResultKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}
