//
//  ReviewsRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire
import Foundation

// MARK: - Reviews Request
class ReviewsRequest: AbstractRequestFactory {
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

extension ReviewsRequest: ReviewsRequestFactory {
    /// get reviews by product ID
    func getReviews(idProduct: Int, completionHandler: @escaping (Alamofire.AFDataResponse<ReviewsResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = ReviewsRequestRouter(baseUrl: baseUrl!, idProduct: idProduct)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension ReviewsRequest {
    // MARK: - Reviews Request Router
    struct ReviewsRequestRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getReviews.json"
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}
