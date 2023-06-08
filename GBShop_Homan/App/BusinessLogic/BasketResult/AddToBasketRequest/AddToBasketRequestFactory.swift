//
//  AddToBasketRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: - Add To Basket Request Factory
protocol AddToBasketRequestFactory {
    /// add to basket by ID
    func addToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
