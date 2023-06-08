//
//  Logout.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

// MARK: - Logout
class Logout: AbstractRequestFactory {
    // properties
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
/// subscription LogoutRequestFactory
extension Logout: LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (Alamofire.AFDataResponse<LogoutResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = LogoutRouter(baseUrl: baseUrl!, idUser: idUser)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension Logout {
    // MARK: - Logout RequestRouter
    struct LogoutRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
}
