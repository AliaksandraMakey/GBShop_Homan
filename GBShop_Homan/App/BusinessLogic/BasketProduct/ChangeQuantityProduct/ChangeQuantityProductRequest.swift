//
//  ChangeQuantityProductRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

class ChangeQuantityProductRequest: BaseRequestFactory, ChangeQuantityProductRequestFactory {
    /// Updates the quantity of a product in the user's basket.
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product.
    ///   - quantity: The new quantity for the product.
    ///   - completionHandler: A closure that is called upon completion with a result that represents success or an error.
    func changeQuantityProduct(idProduct: UUID, quantity: Int, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = ChangeQuantityRouter(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}

extension ChangeQuantityProductRequest {
    /// A router that defines the parameters and configuration for updating the quantity of a product in the user's basket.
    struct ChangeQuantityRouter: RequestRouter {
        // MARK: - Properties
        let baseUrl: URL
        let method: HTTPMethod = .put
        var path: String
        let quantity: Int

        /// Initializes the router with required parameters.
        /// - Parameters:
        ///   - baseUrl: The base URL of the API.
        ///   - idProduct: The unique identifier of the product.
        ///   - quantity: The new quantity for the product.
        init(baseUrl: URL, idProduct: UUID, quantity: Int) {
            self.baseUrl = baseUrl
            self.path = "/api/basket/\(idProduct)/update-product-quantity"
            self.quantity = quantity
        }

        /// The parameters to be included in the request.
        var parameters: Parameters? {
            return [
                "quantity": quantity
            ]
        }
    }
}
