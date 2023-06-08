//
//  ResponseCodable.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation

// MARK: - Post Stub
struct PostStub: Codable {
    // properties
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
// MARK: - Api Error Stub
enum ApiErrorStub: Error {
    case fatalError
}
// MARK: - Error Parser Stub
struct ErrorParserStub: AbstractErrorParser {
    /// parse
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
