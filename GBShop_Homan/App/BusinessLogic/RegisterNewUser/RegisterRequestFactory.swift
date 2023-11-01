//
//  RegisterResultFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation
import Alamofire

/// A protocol for handling user registration and receiving the result.
protocol RegisterResultFactory {
    
    /// Register a new user with the provided information and receive the registration result.
    ///
    /// - Parameters:
    ///   - fullName: The user's full name.
    ///   - email: The user's email address.
    ///   - gender: The user's gender information.
    ///   - password: The user's chosen password.
    ///   - confirmPassword: Confirmation of the user's password.
    ///   - completionHandler: A closure that receives the registration result as an `AFDataResponse`.
    func register(fullName: String,
                  email: String,
                  gender: String,
                  password: String,
                  confirmPassword: String,
                  completionHandler: @escaping (AFDataResponse<RegisterNewUserResult>) -> Void)
}
