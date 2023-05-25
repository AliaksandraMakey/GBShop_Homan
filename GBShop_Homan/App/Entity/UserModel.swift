//
//  User.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

//MARK: - User
struct User: Codable {
    // properties
    let id: Int
    let login: String
    let name: String
    let lastname: String
    /// User Keys
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
