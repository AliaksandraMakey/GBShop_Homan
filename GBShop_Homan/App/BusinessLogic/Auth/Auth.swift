//
//  Auth.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation
import Alamofire

import Foundation
import Alamofire

//MARK: - Auth
class Auth: AbstractRequestFactory {
    /// properties
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    
    let baseUrl =  "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"
    /// init
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}
//MARK: - extension Auth
/// subscription AuthRequestFactory
extension Auth: AuthRequestFactory {
    /// login
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<AuthResult>) -> Void) {
        guard let url = URL(string: baseUrl) else {return}
        let requestModel = Login(baseUrl: url, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
//MARK: - Auth extension
extension Auth {
    //MARK: - Login RequestRouter
    struct Login: RequestRouter {
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
