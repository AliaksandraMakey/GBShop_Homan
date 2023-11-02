//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

protocol AbstractErrorParser {
    /// Parses a result error into a custom error type.
    ///
    /// - Parameter result: The original error to be parsed.
    /// - Returns: The parsed error.
    func parse(_ result: Error) -> Error

    /// Parses an HTTP response, data, and error into a custom error type.
    ///
    /// - Parameters:
    ///   - response: The HTTP URL response received.
    ///   - data: The response data received.
    ///   - error: Any error that occurred during the request.
    /// - Returns: The parsed error, or `nil` if no custom error is generated.
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
