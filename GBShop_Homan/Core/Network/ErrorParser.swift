//
//  ErrorParser.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

//MARK: - Error Parser
/// subscription AbstractErrorParser
class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
