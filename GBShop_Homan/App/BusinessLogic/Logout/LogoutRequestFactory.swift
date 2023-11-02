//
//  LogoutRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

/// A protocol for creating requests to log out the user.
protocol LogoutRequestFactory {
    /// Logs out the user.
    ///
    /// - Parameter completionHandler: A closure that handles the result of the logout operation as `Result<Void, Error>`.
    func logout(completionHandler: @escaping (Result<Void, Error>) -> Void)
}
