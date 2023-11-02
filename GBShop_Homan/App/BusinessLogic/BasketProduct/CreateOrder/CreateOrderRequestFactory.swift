//
//  CreateOrderRequestFactory.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 02.11.2023.
//

import Foundation
import Alamofire

protocol CreateOrderRequestFactory {
    func createOrder(
        completionHandler: @escaping (Result<Void, Error>) -> Void)
}
