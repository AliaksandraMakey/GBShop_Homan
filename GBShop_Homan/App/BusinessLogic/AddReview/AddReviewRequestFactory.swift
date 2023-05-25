//
//  AddReviewRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire

//MARK: - Add Review Request Factory
protocol AddReviewRequestFactory {
    /// add reviews by ID
    func addReview(idUser: Int,
                   idProduct: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
