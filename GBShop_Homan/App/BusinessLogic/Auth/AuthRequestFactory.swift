//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation
import Alamofire

// MARK: - Auth Request Factory
protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping
               (AFDataResponse<AuthResult>) -> Void)
}
