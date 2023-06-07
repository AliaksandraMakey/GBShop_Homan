//
//  ChangesProfileRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation
import Alamofire

// MARK: - Changes Profile Request Factory
protocol ChangesProfileRequestFactory {
    func changesProfile(idUser: Int,
                       userName: String,
                       password: String,
                       email: String,
                       gender: String,
                       creditCard: String,
                       bio: String,
               completionHandler: @escaping (AFDataResponse<ChangesProfileResult>) -> Void)
}
