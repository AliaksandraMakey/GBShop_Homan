//
//  AuthorizationRequestInterceptor.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Alamofire
import KeychainSwift

class AuthorizationRequestInterceptor {
    static let shared = AuthorizationRequestInterceptor()

    typealias CompletionHandler = ((Result<Data, Error>) -> Void)
    var request: Alamofire.Request?
    let retryLimit = 3
    private let localStorageManager = LocalStorageManager.shared

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

extension AuthorizationRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        guard let url = urlRequest.url?.absoluteString else {
            completion(.success(request))
            return
        }
        if !url.contains("/auth/") {
            let token = localStorageManager.getAccessTokenString()
                if (!token.isEmpty) {
                let bearerToken = "Bearer \(token)"
                request.setValue(bearerToken, forHTTPHeaderField: "Authorization")
                completion(.success(request))
            }
        } else {
            completion(.success(request))
        }
    }

}
