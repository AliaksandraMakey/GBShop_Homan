//
//  ProductResult.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

// MARK: - Product Result
struct ProductResult: Codable {
    // properties
    let name: String
    let image: String
    let price: Int
    let status: String
    let evaluation: Int
    let description: String

}
