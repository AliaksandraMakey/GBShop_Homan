//
//  Register.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Alamofire
import Foundation

// MARK: - Auth
class Register: BaseRequestFactory, RegisterResultFactory {
    /// register function
    /// - Parameters:
    ///   - fullName: String
    ///   - email: String
    ///   - gender: String
    ///   - password: String min 8 symbols
    ///   - confirmPassword: String min 8 symbols
    ///   - completionHandler: AFDataResponse<RegisterNewUserResult>
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

            self.request(request: requestModel,
                         completionHandler: completionHandler)
        }
    }
}

extension Register {
    // MARK: - Register Router
    struct RegisterRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/auth/register"
        let fullName: String
        let email: String
        let gender: String
        let password: String
        let confirmPassword: String
        var parameters: Parameters? {
            return [
                 "fullName": fullName,
                 "email": email,
                 "gender": gender,
                 "password": password,
                 "confirmPassword": confirmPassword
            ]}
    }
}
