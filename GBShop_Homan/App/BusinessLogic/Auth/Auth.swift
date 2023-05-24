//
//  Auth.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation
import Alamofire

//MARK: - Auth
class Auth: AbstractRequestFactory {
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
/// subscription AuthRequestFactory
extension Auth: AuthRequestFactory {
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = AuthRouter(baseUrl: baseUrl!, login: userName, password: password)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension Auth {
    //MARK: - Auth Router
    struct AuthRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]}
    }
}
