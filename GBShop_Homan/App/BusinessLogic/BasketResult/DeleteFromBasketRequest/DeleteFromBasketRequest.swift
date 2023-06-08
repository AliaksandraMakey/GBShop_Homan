//
//  DeleteFromBasketRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: - Request
class DeleteFromBasketRequest: AbstractRequestFactory {
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
/// subscription DeleteFromBasketRequestFactory
extension DeleteFromBasketRequest: DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = DeleteFromBasketRouter(baseUrl: baseUrl!, idProduct: idProduct)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension DeleteFromBasketRequest {
    // MARK: - Delete From Basket Router
    struct DeleteFromBasketRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct
            ]
        }
    }
}
