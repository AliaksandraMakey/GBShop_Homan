//
//  AuthorizationRequestInterceptor.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Alamofire
import KeychainSwift

class AuthorizationRequestInterceptor {
    // MARK: - Properties
    static let shared = AuthorizationRequestInterceptor()
    typealias CompletionHandler = ((Result<Data, Error>) -> Void)
    var request: Alamofire.Request?
    let retryLimit = 3
    private let localStorageManager = LocalStorageManager.shared
    /// Creates a request to the server.
    ///
    /// - Parameters:
    ///   - url: The URL to send the request to.
    ///   - method: The HTTP method for the request (default is .get).
    ///   - parameters: The request parameters to be sent in the request body (default is nil).
    ///   - encoding: The method of encoding request parameters (default is URLEncoding.queryString).
    ///   - headers: Additional HTTP headers (default is nil).
    ///   - interceptor: Request interceptor for additional processing (default is nil).
    ///   - completion: A closure to be called upon completion of the request, returning the result of the request.
    func request(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.queryString, headers: HTTPHeaders? = nil,
                 interceptor: RequestInterceptor? = nil, completion: @escaping CompletionHandler) {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: TokenRefresh.self) { response in
                if let data = response.data {
                    completion(.success(data))
                } else {
                    completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                }
            }
    }
}
// An interceptor to adapt and modify HTTP requests for adding authorization headers.
///
/// This interceptor checks the URL of the request and, if it doesn't contain "/auth/" or "/product/",
/// it adds an "Authorization" header with a bearer token retrieved from the local storage manager.
///
/// - Note: This interceptor is typically used to handle authentication and authorization in API requests.
extension AuthorizationRequestInterceptor: RequestInterceptor {
    /// Adapts the URL request by adding authorization headers if necessary.
    ///
    /// - Parameters:
    ///   - urlRequest: The original URL request to be adapted.
    ///   - session: The session associated with the request.
    ///   - completion: A closure to be called with the adapted URL request or an error.
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        guard let url = urlRequest.url?.absoluteString else {
            completion(.success(request))
            return
        }
        if !url.contains("/auth/") && !url.contains("/product/") {
            let token = localStorageManager.getAccessTokenString()
            if !token.isEmpty {
                let bearerToken = "Bearer \(token)"
                request.setValue(bearerToken, forHTTPHeaderField: "Authorization")
            }
        }
        completion(.success(request))
    }
}
