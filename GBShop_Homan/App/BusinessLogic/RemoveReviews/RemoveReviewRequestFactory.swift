//
//  RemoveReviewRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Alamofire

//MARK: - Remove Review Request Factory
protocol RemoveReviewRequestFactory {
    /// remove review by ID
    func removeReview(id: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) 
}
