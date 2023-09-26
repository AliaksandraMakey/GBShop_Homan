//
//  ChangesProfile.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

// MARK: - Request
class ChangesProfileRequest: BaseRequestFactory, ChangesProfileRequestFactory {
    func changesProfile(fullName: String,
                        gender: String,
                        isAdmin: Bool,
                        completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        if baseUrl != nil {
            let requestModel = ChangesProfileRouter(
                baseUrl: baseUrl!,
                fullName: fullName,
                isAdmin: isAdmin,
                gender: gender
            )
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension ChangesProfileRequest {
    // MARK: - Changes Profile Request Router
    struct ChangesProfileRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .put
        let path: String = "/api/user/update"
        let fullName: String
        let isAdmin: Bool
        let gender: String
        //        let bio: String
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
