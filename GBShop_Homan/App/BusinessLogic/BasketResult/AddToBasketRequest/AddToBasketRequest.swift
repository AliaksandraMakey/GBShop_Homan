//
//  AddToBasketRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: - Request
class AddToBasketRequest: AbstractRequestFactory {
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
extension AddToBasketRequest: AddToBasketRequestFactory {

    // add to basket by ID
    /// - Parameters:
    ///   - idProduct: Int
    ///   - quantity: Int
    ///   - completionHandler: (AFDataResponse<AddToBasketResult>) -> Void
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = AddToBasketRouter(baseUrl: baseUrl!,
                                                 idProduct: idProduct,
                                                 quantity: quantity)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension AddToBasketRequest {
    // MARK: - Add To Basket Router
    struct AddToBasketRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        let idProduct: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct,
                "quantity" : quantity
            ]
        }
    }
}
