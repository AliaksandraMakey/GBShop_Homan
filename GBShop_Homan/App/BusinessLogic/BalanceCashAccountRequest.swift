//
//  BalanceCashAccountRequest.swift
//
//
//  Created by Александра Макей on 27.10.2023.
//

import Foundation
import Alamofire

class BalanceCashAccountRequest: BaseRequestFactory, BalanceCashAccountRequestFactory {
    /// This function is responsible for retrieving the balance from a cash account.
    ///
    /// - Parameters:
    ///   - completionHandler: A closure that takes a `Result` object, which can either contain a `CashAccount` or an `Error`, to handle the result of the operation.
    func getBalanceFromCashAccount(completionHandler: @escaping (Result<CashAccount, Error>) -> Void) {
        if let baseUrl {
            let requestModel = BalanceCashAccountRouter(baseUrl: baseUrl)
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let cashAccount = try JSONDecoder().decode(CashAccount.self, from: data)
                            completionHandler(.success(cashAccount))
                        } catch {
                            completionHandler(.failure(error))
                        }
                    } else {
                        completionHandler(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        }
    }
}

extension BalanceCashAccountRequest {
    // MARK: - Balance Cash Account Router
    struct BalanceCashAccountRouter: RequestRouter {
        /// Properties required to make the HTTP request
        var parameters: Alamofire.Parameters?
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/api/cash-account/all-balance"
    }
}
