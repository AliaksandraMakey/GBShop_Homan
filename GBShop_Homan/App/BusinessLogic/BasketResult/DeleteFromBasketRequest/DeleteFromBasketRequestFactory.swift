//
//  DeleteFromBasketRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: -
protocol DeleteFromBasketRequestFactory {
    /// delete from basket by ID
    func deleteFromBasket(idProduct: Int,
                          completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
}
