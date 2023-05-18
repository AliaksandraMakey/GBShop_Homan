//
//  ErrorParser.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

//MARK: - ErrorParser
/// subscription AbstractErrorParser
class ErrorParser: AbstractErrorParser {
    /// parse
    func parse(_ result: Error) -> Error {
        return result
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
