//
//  DeleteProductFromBasketRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

class DeleteProductFromBasketRequest: BaseRequestFactory, DeleteProductFromBasketRequestFactory {
    /// Deletes a product from the user's basket by its unique identifier.
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product to be deleted.
    ///   - completionHandler: A closure that is called upon completion with a result that represents success or an error.
    func deleteProductFromBasketByID(idProduct: UUID, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = DeleteProductRouter(baseUrl: baseUrl, idProduct: idProduct)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}

extension DeleteProductFromBasketRequest {
    /// A router that defines the parameters and configuration for deleting a product from the user's basket.
    struct DeleteProductRouter: RequestRouter {
        /// The base URL for the request.
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .delete
        var path: String

        /// Initializes the router with required parameters.
        /// - Parameters:
        ///   - baseUrl: The base URL of the API.
        ///   - idProduct: The unique identifier of the product to be deleted.
        init(baseUrl: URL, idProduct: UUID) {
            self.baseUrl = baseUrl
            self.path = "/api/basket/\(idProduct)/delete-product"
        }
    }
}
