//
//  GetBasketResult.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Foundation

struct GetBasketResult: Codable {
    // MARK: - Properties
    let amount: Double
    let countGoods: Int
    let products: [ProductFromBasket]
    // MARK: - Keys
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case countGoods = "countGoods"
        case products = "contents"
    }
}
