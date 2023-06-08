//
//  RemoveReviewRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire
import Foundation

// MARK: - Remove Review Request
class RemoveReviewRequest: AbstractRequestFactory {
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
/// subscription RemoveReviewRequestFactory
extension RemoveReviewRequest: RemoveReviewRequestFactory {
    /// remove review by ID
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = RemoveReviewRequestRouter(baseUrl: baseUrl!, idReview: id)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension RemoveReviewRequest {
    // MARK: - Remove Review Request Router
    struct RemoveReviewRequestRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"
        let idReview: Int
        var parameters: Parameters? {
            return [
                "id_review": idReview
            ]
        }
    }
}
