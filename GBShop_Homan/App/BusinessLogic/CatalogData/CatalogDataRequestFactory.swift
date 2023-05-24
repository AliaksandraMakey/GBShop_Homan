//
//  CatalogDataRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation
import Alamofire

//MARK: - Catalog Data Request Factory
protocol CatalogDataRequestFactory {
    /// get product by ID and page number
    func getCatalogData(pageNumber: Int,
                        idCategory: Int,
                        completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
    
}
