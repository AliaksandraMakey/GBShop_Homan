//
//  ReviewsRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire

// MARK: - Reviews Request Factory
protocol ReviewsRequestFactory {
    /// get reviews by ID
    func getReviews(idProduct: Int,
                    completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void)
}
