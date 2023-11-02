//
//  GetTotalPriceBasketRequest.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 01.11.2023.
//

import Foundation
import Alamofire

/// The `GetTotalPriceBasketRequest` class is responsible for sending an HTTP request to retrieve the total price of items in a shopping basket.
class GetTotalPriceBasketRequest: BaseRequestFactory, GetTotalPriceBasketRequestFactory {
    /// Initiates an HTTP request to retrieve the total price of items in a shopping basket.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure to handle the result of the request, which includes a `Result` type with a `Double` representing the total price or an error.
    func getTotalPrice(completionHandler: @escaping (Result<Double, Error>) -> Void) {
        if let baseUrl {
            let requestModel = GetTotalPriceRouter(baseUrl: baseUrl)

            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let totalPrice = try JSONDecoder().decode(Double.self, from: data)
                            completionHandler(.success(totalPrice))
                        } catch {
                            completionHandler(.failure(error))
                        }
                    } else {
                        completionHandler(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
}

extension GetTotalPriceBasketRequest {
    /// A router that defines the parameters and configuration for getting  total price user's basket.
    struct GetTotalPriceRouter: RequestRouter {
        /// The base URL for the request.
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/api/basket/order/total-price"
        var parameters: Parameters?
    }
}
