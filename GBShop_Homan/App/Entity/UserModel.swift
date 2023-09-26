//
//  User.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: UUID?
    let fullName: String
    let email: String
    let isAdmin: Bool
    let gender: String
}
