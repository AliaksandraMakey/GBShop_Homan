//
//  Auth.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

class Auth: BaseRequestFactory {
    /// Log in a user with the provided login and password.
    ///
    /// - Parameters:
    ///   - login: The user's login or email.
    ///   - password: The user's password.
    ///   - completionHandler: A closure that receives the authentication result as an `AFDataResponse`.
    func login(login: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void) {
        if let baseUrl {
            let requestModel = AuthRouter(baseUrl: baseUrl,
                                          login: login,
                                          password: password)
            self.request(request: requestModel,
                         completionHandler: completionHandler)
        }
    }
}

extension Auth: AuthRequestFactory {
    /// Structure representing the route for user auth.
    struct AuthRouter: RequestRouter {
        /// The base URL for the request.
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/auth/login"
        let login: String
        let password: String
        /// The parameters to be included in the request.
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password
            ]
        }
    }
}

