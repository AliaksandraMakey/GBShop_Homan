//
//  ChangeQuantityProductRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

/// A protocol for making requests to change the quantity of a product in the basket.
protocol ChangeQuantityProductRequestFactory {
    /// Changes the quantity of a product in the basket.
    ///
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product.
    ///   - quantity: The new quantity to set for the product.
    ///   - completionHandler: A closure to be called with the result of the operation, containing the updated quantity or an error.
    func changeQuantityProduct(idProduct: UUID, quantity: Int, completionHandler: @escaping (Result<Void, Error>) -> Void)
}
