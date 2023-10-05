//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

// MARK: - Auth Request Factory
protocol AuthRequestFactory {

    /// login function
    /// - Parameters:
    ///   - login: email(String)
    ///   - password: String min 8 symbols
    ///   - completionHandler: AFDataResponse<AuthResult>
    func login(login: String,
               password: String,
               completionHandler: @escaping
               (AFDataResponse<AuthResult>) -> Void)
}
