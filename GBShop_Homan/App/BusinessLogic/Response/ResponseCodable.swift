//
//  ResponseCodable.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
enum ApiErrorStub: Error {
    case fatalError
}
struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
