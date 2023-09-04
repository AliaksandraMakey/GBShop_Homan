//
//  GetBasketResult.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Foundation

// MARK: - Get Basket Result
struct GetBasketResult: Codable {
    // properties
    let amount: Double
    let countGoods: Int
    let products: [ProductFromBasket]
    /// GetBasket Keys
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case countGoods = "countGoods"
        case products = "contents"
    }
}
