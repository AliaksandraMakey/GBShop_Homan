//
//  ResponseCodable.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation

/// A struct representing a post stub with specific properties.
struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

/// An enumeration representing a stubbed API error.
enum ApiErrorStub: Error {
    case fatalError
}

/// A struct conforming to the `AbstractErrorParser` protocol for stubbed error parsing.
struct ErrorParserStub: AbstractErrorParser {
    /// Parses a result error and returns a stubbed API error.
    /// - Parameter result: The error to be parsed.
    /// - Returns: A stubbed API error.
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }

    /// Parses an HTTP response, data, and an error, and returns the provided error.
    /// - Parameters:
    ///   - response: The HTTP URL response.
    ///   - data: The data received in the response.
    ///   - error: The error received during the request.
    /// - Returns: The provided error.
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
