//
//  CreateOrderModel.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 01.11.2023.
//

import Foundation

 struct CreateOrderModel: Codable {
    let productsInOrder: [ProductBasketRequest]
 }

struct ProductBasketRequest: Codable {
    let idNumber: String
    let quantity: Int
}
