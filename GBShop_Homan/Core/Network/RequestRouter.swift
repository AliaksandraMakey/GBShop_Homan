//
//  RequestRouterEncoding.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire

// MARK: - Request Router Encoding
enum RequestRouterEncoding {
    case url, json
}
// MARK: - protocol Request Router
protocol RequestRouter: URLRequestConvertible {
    // properties
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullUrl: URL { get }
    var encoding: RequestRouterEncoding { get }
}
// MARK: - extension Request Router
extension RequestRouter {
    // properties
    var fullUrl: URL {
    return baseUrl.appendingPathComponent(path)
    }
    var encoding: RequestRouterEncoding {
        return .url
    }
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: fullUrl)
        urlRequest.httpMethod = method.rawValue
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
