//
//  Register.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Alamofire
import Foundation

/// Factory for creating network requests to register a new user.
class Register: BaseRequestFactory, RegisterResultFactory {
    /// Register a new user.
    ///
    /// - Parameters:
    ///   - fullName: Full name of the user.
    ///   - email: User's email.
    ///   - gender: User's gender.
    ///   - password: User's password (minimum 8 characters).
    ///   - confirmPassword: Confirmation of the user's password (minimum 8 characters).
    ///   - completionHandler: A closure that takes the result of the request as `AFDataResponse<RegisterNewUserResult>`.
    func register(fullName: String,
                  email: String,
                  gender: String,
                  password: String,
                  confirmPassword: String,
                  completionHandler: @escaping (AFDataResponse<RegisterNewUserResult>) -> Void) {
        if let baseUrl {
            let requestModel = RegisterRouter(baseUrl: baseUrl,
                                              fullName: fullName,
                                              email: email,
                                              gender: gender,
                                              password: password,
                                              confirmPassword: confirmPassword)

            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension Register {
    /// Structure representing the route for user registration.
    struct RegisterRouter: RequestRouter {
        /// The base URL for the request.
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/auth/register"
        let fullName: String
        let email: String
        let gender: String
        let password: String
        let confirmPassword: String
        
        /// The parameters to be included in the request.
        var parameters: Parameters? {
            return [
                "fullName": fullName,
                "email": email,
                "gender": gender,
                "password": password,
                "confirmPassword": confirmPassword
            ]
        }
    }
}
