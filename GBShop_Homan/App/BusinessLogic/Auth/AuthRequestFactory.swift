//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

/// A protocol for handling user authentication and login.
protocol AuthRequestFactory {
    /// Log in a user with the provided login and password.
    ///
    /// - Parameters:
    ///   - login: The user's login or email.
    ///   - password: The user's password.
    ///   - completionHandler: A closure that receives the authentication result as an `AFDataResponse`.
    func login(login: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void)
}
