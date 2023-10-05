//
//  GetBasketRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: - Request
class GetBasketRequest: AbstractRequestFactory {
    // properties
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    let baseUrl = URL(string: "http://localhost:8080")

    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
/// subscription GetBasketRequestFactory
extension GetBasketRequest: GetBasketRequestFactory {
    /// get basket by user ID
    func getBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        if let baseUrl {
            let requestModel = GetBasketRouter(baseUrl: baseUrl,
                                                idUser: idUser)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension GetBasketRequest {
    // MARK: - Get Basket Router
    struct GetBasketRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user" : idUser
            ]
        }
    }
}
