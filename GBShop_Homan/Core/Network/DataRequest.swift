//
//  DataRequest.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

extension DataRequest {
    /// Handles the response of a network request by decoding it into a Codable model.
    ///
    /// - Parameters:
    ///   - errorParser: The error parser used to handle errors in the response.
    ///   - queue: The dispatch queue for handling completion blocks. The default is the main queue.
    ///   - completionHandler: A closure to handle the response with a Codable result.
    /// - Returns: The original DataRequest object with the response handling configured.
    @discardableResult
    func responseCodable<T: Decodable>(
        errorParser: AbstractErrorParser,
        queue: DispatchQueue = .main,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> Self {
            let responseSerializer = CustomDecodableSerializer<T>(errorParser: errorParser)
            return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
        }
}
