//
//  GetAllBasketProductsRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

class GetAllBasketProductsRequest: BaseRequestFactory, GetAllBasketProductsRequestFactory {
    // MARK: - Properties
    /// Executes a request to retrieve all products from the basket.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure that will be called after the request is completed with the result.
    ///                      The result can be an array of [BasketProduct] in case of success
    ///                      or an error (Error) in case of failure.
    func getAllBasketProducts(completionHandler: @escaping (Result<[BasketProduct], Error>) -> Void) {
        if let baseUrl {
            let requestModel = GetBasketProductRouter(baseUrl: baseUrl)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let basketProducts = try JSONDecoder().decode([BasketProduct].self, from: data)
                            completionHandler(.success(basketProducts))
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

extension GetAllBasketProductsRequest {
    // MARK: - Get Basket Product Router
    struct GetBasketProductRouter: RequestRouter {
        /// Properties required to make the HTTP request
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/api/basket"
    }
}
