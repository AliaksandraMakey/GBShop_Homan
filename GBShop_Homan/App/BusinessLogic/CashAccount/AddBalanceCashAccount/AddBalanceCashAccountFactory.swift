//
//  AddBalanceCashAccountFactory.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 27.10.2023.
//

import Foundation
import Alamofire

/// A protocol for creating requests to add balance to a cash account.
protocol AddCashAccountRequestFactory {
    /// Adds balance to a cash account.
    ///
    /// - Parameters:
    ///   - balance: The amount of balance to be added to the cash account.
    ///   - completionHandler: A closure that takes an `AFDataResponse<Data>` to handle the HTTP status response.
    func addBalanceToCashAccount(balance: Double, completionHandler: @escaping (Result<Void, Error>) -> Void)
}
