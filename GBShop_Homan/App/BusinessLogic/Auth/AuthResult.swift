//
//  AuthResult.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

//MARK: - Auth Result
struct AuthResult: Codable {
    // properties
    let result: Int
    let user: User
}
