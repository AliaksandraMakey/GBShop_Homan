//
//  GetTotalPriceBasketRequestFactory.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 01.11.2023.
//

import Alamofire

protocol GetTotalPriceBasketRequestFactory {
    func getTotalPrice(completionHandler: @escaping (Result<Double, Error>) -> Void)
}
