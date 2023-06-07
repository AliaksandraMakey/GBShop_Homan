//
//  ProductRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation
import Alamofire

// MARK: - Product Request
class ProductRequest: AbstractRequestFactory {
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
/// subscription ProductRequestFactory
extension ProductRequest: ProductRequestFactory {
    /// get product by ID
    func getProductBy(id: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = ProductRequestRouter(baseUrl: baseUrl!, idProduct: id)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension ProductRequest {
    // MARK: - Product Request Router
    struct ProductRequestRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product" : idProduct
            ]
        }
    }
}
