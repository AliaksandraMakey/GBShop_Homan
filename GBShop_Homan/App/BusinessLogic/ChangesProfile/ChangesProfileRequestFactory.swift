//
//  ChangesProfileRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

/// The `ChangesProfileRequestFactory` protocol defines a set of methods for creating and handling requests related to updating user profiles.
protocol ChangesProfileRequestFactory {
    /// Initiates an HTTP request to update a user's profile with the specified parameters.
    ///
    /// - Parameters:
    ///   - fullName: The full name to be updated in the user's profile.
    ///   - gender: The new gender for the user's profile.
    ///   - isAdmin: A boolean flag indicating whether the user has admin privileges.
    ///   - completionHandler: A closure to handle the result of the request, which includes a `Result` type indicating success or an error.
    func changesProfile(fullName: String,
                        gender: String,
                        isAdmin: Bool,
                        completionHandler: @escaping (Result<Void, Error>) -> Void)
}
