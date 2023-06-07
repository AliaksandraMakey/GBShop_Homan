//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

// MARK: - Abstract Error Parser
protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?,
               data: Data?,
               error: Error?) -> Error?
}
