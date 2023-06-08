//
//  CatalogDataRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire
import Foundation

// MARK: - Catalog Data Request Factory
protocol CatalogDataRequestFactory {
    /// get product 
    func getCatalogData(products: [Product], completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)

}
