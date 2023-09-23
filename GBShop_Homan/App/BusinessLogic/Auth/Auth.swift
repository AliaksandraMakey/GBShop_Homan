//
//  Auth.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

// MARK: - Auth
class Auth: BaseRequestFactory, AuthRequestFactory {
    func login(login: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = AuthRouter(baseUrl: baseUrl!, login: login, password: password)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension Auth {
    // MARK: - Auth Router
    struct AuthRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/auth/login"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "login": login,
                "password": password
            ]}
    }
}
