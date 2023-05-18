//
//  LoginResult.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

//MARK: - AuthResult
struct AuthResult: Codable {
    /// properties
    let result: Int
    let user: User
}
