//
//  CatalogData.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire
import Foundation

class CatalogDataRequest: BaseRequestFactory, CatalogDataRequestFactory {
    /// Fetch catalog data and provide the result to the completion handler.
    ///
    /// - Parameter completionHandler: A closure that receives the result of the catalog data retrieval.
    func getCatalogData(completionHandler: @escaping (Result<[Product], Error>) -> Void) {
        if let baseUrl {
            let requestModel = CatalogDataRouter(baseUrl: baseUrl)
            var request = try? requestModel.asURLRequest()

            AF.request(request!).response { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let products = try JSONDecoder().decode([Product].self, from: data)
                            completionHandler(.success(products))
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

extension CatalogDataRequest {
    /// Structure representing the route for catalog data.
    struct CatalogDataRouter: RequestRouter {
        /// The base URL for the request.
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/api/product"
    }
}
