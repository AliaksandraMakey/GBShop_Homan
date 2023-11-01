//
//  GetAllBasketProductsRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

/// The `GetAllBasketProductsRequestFactory` protocol defines a method for creating a request to retrieve all products from the basket.
protocol GetAllBasketProductsRequestFactory {
    /// Creates and executes a request to retrieve all products from the basket.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure that will be called after the request is completed with the result.
    ///                      The result can be an array of [BasketProduct] in case of success
    ///                      or an error (Error) in case of failure.
    func getAllBasketProducts(completionHandler: @escaping (Result<[BasketProduct], Error>) -> Void)
}
