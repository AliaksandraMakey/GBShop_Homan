//
//  DeleteProductFromBasketRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

/// A protocol for making requests to delete a product from the basket by its unique identifier.
protocol DeleteProductFromBasketRequestFactory {
    /// Deletes a product from the basket using its unique identifier.
    ///
    /// - Parameters:
    ///   - idProduct: The unique identifier of the product to be deleted.
    ///   - completionHandler: A closure to be called with the result of the operation, containing a status code or an error.
    func deleteProductFromBasketByID(idProduct: UUID, completionHandler: @escaping (Result<Void, Error>) -> Void)
}
