//
//  BasketProductModel.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 26.10.2023.
//

import Foundation

// MARK: - Basket Product Model
struct BasketProduct: Codable {
    // MARK: - Properties
    let product: Product
    var quantity: Int
}
