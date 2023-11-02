//
//  CreateOrderRequest.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 02.11.2023.
//

import Alamofire
import Foundation

/// The `CreateOrderRequest` class is responsible for sending an HTTP request to create a new order.
class CreateOrderRequest: BaseRequestFactory, CreateOrderRequestFactory {
    /// Initiates an HTTP request to create a new order.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure to handle the result of the request, which includes a `Result` type.
    func createOrder(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = CreateOrderRouter(baseUrl: baseUrl)

            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}
extension CreateOrderRequest {
    struct CreateOrderRouter: RequestRouter {
        /// Properties required to make the HTTP request
         var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .put
        let path: String = "/api/basket/order/create"
    }
}
