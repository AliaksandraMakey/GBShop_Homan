//
//  ChangesProfile.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

/// The `ChangesProfileRequest` class is responsible for sending an HTTP request to update a user's profile.
class ChangesProfileRequest: BaseRequestFactory, ChangesProfileRequestFactory {
    /// Initiates an HTTP request to update a user's profile with the specified parameters.
    ///
    /// - Parameters:
    ///   - fullName: The full name to be updated in the user's profile.
    ///   - gender: The new gender for the user's profile.
    ///   - isAdmin: A boolean flag indicating whether the user has admin privileges.
    ///   - completionHandler: A closure to handle the result of the request, which includes a `Result` type.
    func changesProfile(fullName: String,
                        gender: String,
                        isAdmin: Bool,
                        completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = ChangesProfileRouter(
                baseUrl: baseUrl,
                fullName: fullName,
                isAdmin: isAdmin,
                gender: gender
            )
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}
extension ChangesProfileRequest {
    // MARK: - Changes Profile Request Router
    struct ChangesProfileRouter: RequestRouter {
        /// Properties required to make the HTTP request
        let baseUrl: URL
        let method: HTTPMethod = .put
        let path: String = "/api/user/update"
        let fullName: String
        let isAdmin: Bool
        let gender: String
        //        let bio: String
        /// The parameters to be included in the request.
        var parameters: Parameters? {
            return [
                "fullName": fullName,
                "isAdmin": isAdmin,
                "gender": gender
                //                "bio": bio
            ]
        }
    }
}
