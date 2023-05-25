//
//  ProductRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire

//MARK: - Product Request Factory
protocol ProductRequestFactory {
    /// get product by ID
    func getProductBy(id: Int,
                      completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
