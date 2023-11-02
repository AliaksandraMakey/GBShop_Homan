//
//  CustomDecodableSerializer.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire
import Foundation

/// A custom data response serializer for decoding network responses into Codable models with error handling.
class CustomDecodableSerializer<T: Decodable>: DataResponseSerializerProtocol {
    /// The error parser used to handle errors in network responses.
    private let errorParser: AbstractErrorParser
    /// Initializes the custom data response serializer with an error parser.
    ///
    /// - Parameter errorParser: The error parser to handle errors in responses.
    init(errorParser: AbstractErrorParser) {
        self.errorParser = errorParser
    }
    /// Serializes the network response, handling errors and decoding it into a Codable model.
    ///
    /// - Parameters:
    ///   - request: The original URLRequest of the request.
    ///   - response: The HTTPURLResponse received from the server.
    ///   - data: The data received in the response.
    ///   - error: Any error that occurred during the request.
    /// - Returns: The decoded Codable model or an error if any occurred.
    /// - Throws: An error if the response or decoding fails.
    func serialize(request: URLRequest?,
                   response: HTTPURLResponse?,
                   data: Data?,
                   error: Error?) throws -> T {
        if let error = errorParser.parse(response: response, data: data, error: error) {
            throw error
        }
        do {
            let data = try DataResponseSerializer().serialize(request: request,
                                                              response: response,
                                                              data: data,
                                                              error: error)
            let value = try JSONDecoder().decode(T.self, from: data)
            return value
        } catch {
            let customError = errorParser.parse(error)
            throw customError
        }
    }
}
