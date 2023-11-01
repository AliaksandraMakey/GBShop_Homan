//
//  CatalogDataRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire
import Foundation

protocol CatalogDataRequestFactory {
    /// Retrieves catalog data.
    /// - Parameter completionHandler: A closure that is called upon completion with a result containing an array of `Product` or an error.
    func getCatalogData(completionHandler: @escaping (Result<[Product], Error>) -> Void)
}

