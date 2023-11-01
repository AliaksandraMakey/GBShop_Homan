//
//  RegisterNewUserResult.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation

// MARK: - Register New User Result
struct RegisterNewUserResult: Codable {
    // MARK: - Properties
    var fullName: String
    var gender: String
    var email: String
    var password: String
    var confirmPassword: String
}
