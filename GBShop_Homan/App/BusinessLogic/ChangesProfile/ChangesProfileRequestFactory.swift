//
//  ChangesProfileRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

// MARK: - Changes Profile Request Factory
protocol ChangesProfileRequestFactory {
    /// changes profile function
    /// - Parameters:
    ///   - fullName: String
    ///   - gender: String
    ///   - isAdmin: Bool
    ///   - completionHandler: AFDataResponse<Data> return HTTPStatus
    func changesProfile(fullName: String,
                        gender: String,
                        isAdmin: Bool,
                        completionHandler: @escaping (AFDataResponse<Data>) -> Void)
}
