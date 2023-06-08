//
//  ProductFromBasket.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Foundation

// MARK: - Product From Basket
struct ProductFromBasket: Codable {
    // properties
    let productID: Int
    let productName: String
    let price: Int
    let quantity: Int
    /// ProductFromBasket Keys
    enum CodingKeys: String, CodingKey {
        case productID = "id_product"
        case productName = "product_name"
        case price = "price"
        case quantity = "quantity"
    }
}
