//
//  Review.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Foundation

// MARK: - Review
struct Review: Codable {
    // MARK: - Properties
    let idProduct: Int
    let idUser: Int
    let text: String
    /// Review keys
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idUser = "idUser"
        case text = "text"
    }
}
