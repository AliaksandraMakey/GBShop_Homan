//
//  APIError.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 24.10.2023.
//

import Foundation

enum APIError: Error {
    case unauthorized
    case badRequest
    case notFound
    case serverError
    case other(Int)
    case decodingError
    case unknown
}
