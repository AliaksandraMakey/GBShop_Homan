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
    func register(fullName: String, email: String, gender: String, password: String, confirmPassword: String, completionHandler: @escaping (Alamofire.AFDataResponse<RegisterNewUserResult>) -> Void)
}
