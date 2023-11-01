//
//  ProductRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Alamofire

/// A factory protocol for creating requests to add a product to the user's basket.
protocol AddProductToBasketRequestFactory {
    /// Adds a product to the user's basket.
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product to be added to the basket.
    ///   - quantity: The quantity of the product to be added.
    ///   - completionHandler: A closure that is called upon completion with a result that represents success or an error.
    func addProductToBasket(idProduct: UUID, quantity: Int, completionHandler: @escaping (Result<Void, Error>) -> Void)
}
