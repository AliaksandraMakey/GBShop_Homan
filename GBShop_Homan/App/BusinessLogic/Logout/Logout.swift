//
//  Logout.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

class Logout: BaseRequestFactory , LogoutRequestFactory {
    /// Logs out the user.
    ///
    /// - Parameter completionHandler: A closure that handles the result of the logout operation as `Result<Void, Error>`.
    func logout(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = LogoutRouter(baseUrl: baseUrl)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}

extension Logout {
    /// A structure representing the request route for logging out the user.
    struct LogoutRouter: RequestRouter {
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/logout"
    }
}
