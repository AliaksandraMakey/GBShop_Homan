//
//  Logout.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation
import Alamofire

//MARK: - Logout
class Logout: AbstractRequestFactory {
    /// properties
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    
    let baseUrl =  "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"
    /// init
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
//MARK: - extension Logout
/// subscription LogoutRequestFactory
extension Logout: LogoutRequestFactory {
    /// logout
    func logout(idUser: Int, completionHandler: @escaping (Alamofire.AFDataResponse<LogoutResult>) -> Void) {
        guard let url = URL(string: baseUrl) else {return}
        let requestModel = Logout(baseUrl: url, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
//MARK: - Logout extension
extension Logout {
    //MARK: - Logout RequestRouter
    struct Logout: RequestRouter {
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

