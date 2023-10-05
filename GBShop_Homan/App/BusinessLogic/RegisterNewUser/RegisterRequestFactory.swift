//
//  RegisterResultFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation
import Alamofire

// MARK: - Register Request Factory
protocol RegisterResultFactory {
    /// register function
    /// - Parameters:
    ///   - fullName: String
    ///   - email: String
    ///   - gender: String
    ///   - password: String min 8 symbols
    ///   - confirmPassword: String min 8 symbols
    ///   - completionHandler: AFDataResponse<RegisterNewUserResult> return HTTPStatus
    func register(fullName: String,
                  email: String,
                  gender: String,
                  password: String,
                  confirmPassword: String,
                  completionHandler: @escaping (AFDataResponse<RegisterNewUserResult>) -> Void)
}
