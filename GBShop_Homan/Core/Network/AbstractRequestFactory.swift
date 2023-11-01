//
//  AbstractRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire

/// A protocol for defining network request factories.
protocol AbstractRequestFactory {
    /// The error parser used to handle errors in network requests.
    var errorParser: AbstractErrorParser { get }
    /// The session manager responsible for making network requests.
    var sessionManager: Session { get }
    /// The dispatch queue for handling completion blocks.
    var queue: DispatchQueue? { get }
    /// Performs a network request and handles the response using Codable models.
    ///
    /// - Parameters:
    ///   - request: The URLRequestConvertible object that represents the request.
    ///   - completionHandler: A closure to handle the response with a Codable result.
    /// - Returns: The DataRequest object representing the network request.
    @discardableResult
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}
extension AbstractRequestFactory {
    /// Performs a network request and handles the response using Codable models.
    ///
    /// - Parameters:
    ///   - request: The URLRequestConvertible object that represents the request.
    ///   - completionHandler: A closure to handle the response with a Codable result.
    /// - Returns: The DataRequest object representing the network request.
    @discardableResult
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
            return sessionManager
                .request(request)
                .responseCodable(errorParser: errorParser, queue: (queue ?? .main),
                                 completionHandler: completionHandler)
        }
}
