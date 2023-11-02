//
//  BalanceCashAccountRequestFactory.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 27.10.2023.
//

import Foundation

/// A protocol for creating requests to retrieve the balance from a cash account.
protocol BalanceCashAccountRequestFactory {
    /// Retrieves the balance from a cash account.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure that takes a `Result` object, which can either contain a `CashAccount` or an `Error`, to handle the result of the operation.
    func getBalanceFromCashAccount(completionHandler: @escaping (Result<CashAccount, Error>) -> Void)
}
