//
//  ProductModel.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

//MARK: - Product Model
struct Product: Codable {
    // properties
    let id: Int
    let name: String
    let price: Int
    /// Coding Keys
    enum ProductKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
}
