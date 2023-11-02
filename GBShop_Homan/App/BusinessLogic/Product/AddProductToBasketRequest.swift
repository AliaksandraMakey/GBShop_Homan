//
//  AddProductToBasketRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire
import Foundation

class AddProductToBasketRequest: BaseRequestFactory, AddProductToBasketRequestFactory {
    /// Adds a product to the user's basket.
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product to be added to the basket.
    ///   - quantity: The quantity of the product to be added.
    ///   - completionHandler: A closure that is called upon completion with a result that represents success or an error.
    func addProductToBasket(idProduct: UUID, quantity: Int, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = AddProductRouter(baseUrl: baseUrl,
                                                idProduct: idProduct,
                                                quantity: quantity)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}

extension AddProductToBasketRequest {
    /// Structure representing the route for adding a product to the user's basket.
    struct AddProductRouter: RequestRouter {
        /// The base URL for the request.
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String
        let quantity: Int

        /// Initializes the AddProductRouter with the necessary information.
        /// - Parameters:
        ///   - baseUrl: The base URL for the request.
        ///   - idProduct: The unique identifier of the product to be added to the basket.
        ///   - quantity: The quantity of the product to be added.
        init(baseUrl: URL, idProduct: UUID, quantity: Int) {
            self.baseUrl = baseUrl
            self.path = "/api/basket/\(idProduct)/add-product"
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
