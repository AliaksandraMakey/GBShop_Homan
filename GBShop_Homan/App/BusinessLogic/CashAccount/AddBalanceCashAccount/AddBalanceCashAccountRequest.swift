//
//  AddBalanceCashAccountRequest.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 27.10.2023.
//
import Foundation
import Alamofire

class AddBalanceCashAccountRequest: BaseRequestFactory, AddCashAccountRequestFactory {
    /// Adds balance to a cash account.
    /// - Parameters:
    ///   - balance: The amount of balance to add to the cash account.
    ///   - completionHandler: A closure that is called upon completion with a result that represents success or an error.
    func addBalanceToCashAccount(balance: Double, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        if let baseUrl {
            let requestModel = AddCashAccountRouter(
                baseUrl: baseUrl,
                balance: balance
            )
            let requestWithToken = addTokenToRequest(requestModel: requestModel)
            AF.request(requestWithToken).response { response in
                self.processResponse(response: response) { result in
                    completionHandler(result)
                }
            }
        }
    }
}

extension AddBalanceCashAccountRequest {
    // MARK: - Add Cash Account Router
    /// A router that defines the parameters and configuration for adding balance to a cash account.
    struct AddCashAccountRouter: RequestRouter {
        // MARK: - Properties
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "/api/cash-account/add-cash"
        let balance: Double

        /// The parameters to be included in the request.
        var parameters: Parameters? {
            return [
                "balance": balance
            ]
        }
    }
}
