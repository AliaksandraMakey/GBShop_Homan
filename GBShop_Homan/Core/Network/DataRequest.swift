//
//  DataRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation
import Alamofire

//MARK: - extension DataRequest
extension DataRequest {
    @discardableResult
    /// responseCodable
    func responseCodable<T: Decodable>(
        errorParser: AbstractErrorParser,
        queue: DispatchQueue = .main,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> Self {
            let responseSerializer = CustomDecodableSerializer<T>(errorParser: errorParser)
            return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
        }
}
