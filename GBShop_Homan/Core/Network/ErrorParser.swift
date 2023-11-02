//
//  ErrorParser.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

/// A custom error parser conforming to the `AbstractErrorParser` protocol.
class ErrorParser: AbstractErrorParser {

    /// Parses the given result error and returns the same error without modification.
    ///
    /// - Parameter result: The error to be parsed.
    /// - Returns: The same error that was passed in.
    func parse(_ result: Error) -> Error {
        return result
    }

    /// Parses the response, data, and error to extract and return the underlying error.
    ///
    /// - Parameters:
    ///   - response: An HTTPURLResponse object.
    ///   - data: The response data.
    ///   - error: An optional error.
    /// - Returns: The underlying error extracted from the response, data, or error, or `nil` if none is found.
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
