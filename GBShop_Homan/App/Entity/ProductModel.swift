//
//  ProductModel.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation

// MARK: - Product Model
struct Product: Codable {
    // MARK: - Properties
    let id: UUID?
    let idNumber: String
    let name: String
    let status: String
    let rating: Int
    let price: Double
    let image: String
    let shortDescription: String
    let description: String
}
