//
//  RequestRouterEncoding.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire

/// The encoding options for a request router.
enum RequestRouterEncoding {
    case url, json
}
/// A protocol for defining request routers.
protocol RequestRouter: URLRequestConvertible {
    /// The base URL for the router.
    var baseUrl: URL { get }
    /// The HTTP method for the request.
    var method: HTTPMethod { get }
    /// The path for the request.
    var path: String { get }
    /// The parameters to include in the request.
    var parameters: Parameters? { get }
    /// The full URL for the request.
    var fullUrl: URL { get }
    /// The encoding method to use for the request.
    var encoding: RequestRouterEncoding { get }
}
extension RequestRouter {
    /// The full URL for the request, combining the base URL and the path.
    var fullUrl: URL {
        return baseUrl.appendingPathComponent(path)
    }
    /// The default encoding method for the request is URL encoding.
    var encoding: RequestRouterEncoding {
        return .url
    }
    /// Converts the router into a URLRequest and handles encoding based on the selected encoding method.
    ///
    /// - Returns: A URLRequest object for the request.
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
