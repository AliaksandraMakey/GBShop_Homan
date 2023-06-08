//
//  GetBasketRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 08/06/2023.
//

import Alamofire

// MARK: - Get Basket Request Factory
protocol GetBasketRequestFactory {
/// get basket by user ID
    func getBasket(idUser: Int,
                   completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
}
