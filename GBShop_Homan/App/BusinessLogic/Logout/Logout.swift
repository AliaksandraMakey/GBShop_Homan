//
//  Logout.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

// MARK: - Logout
class Logout: BaseRequestFactory, LogoutRequestFactory {
    /// logout function
    /// - Parameter completionHandler: AFDataResponse<Data>
    func logout(completionHandler: @escaping (Alamofire.AFDataResponse<Data>) -> Void) {
        if let baseUrl {
            let requestModel = LogoutRouter(baseUrl: baseUrl)
            var test = try? requestModel.asURLRequest()
            var headers = HTTPHeaders.init()
            headers.add(HTTPHeader.authorization(bearerToken: LocalStorageManager.shared.getAccessTokenString()))
            test?.headers = headers
            self.request(request: test ?? requestModel,
                         completionHandler: completionHandler)
        }
    }
}
extension Logout {
    // MARK: - Logout RequestRouter
    struct LogoutRouter: RequestRouter {
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/auth/logout"
    }
}
