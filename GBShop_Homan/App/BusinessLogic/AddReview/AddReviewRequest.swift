//
//  AddReviewRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire
import Foundation

// MARK: - Add Reviews Request
class AddReviewRequest: AbstractRequestFactory {
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
/// subscription AddReviewRequestFactory
extension AddReviewRequest: AddReviewRequestFactory {
    /// add review by product ID and user ID
    func addReview(idUser: Int, idProduct: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = AddReviewRequestRouter(baseUrl: baseUrl!, idUser: idUser, idProduct: idProduct, text: text)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension AddReviewRequest {
    // MARK: - Add Reviews Request Router
    struct AddReviewRequestRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"
        let idUser: Int
        let idProduct: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "id_product": idProduct,
                "text": text
            ]
        }
    }
}
