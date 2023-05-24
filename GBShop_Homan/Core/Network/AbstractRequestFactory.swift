//
//  AbstractRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire

//MARK: - protocol Abstract Request Factory
protocol AbstractRequestFactory {
    // properties
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}
extension AbstractRequestFactory {
    @discardableResult
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
            return sessionManager
                .request(request)
                .responseCodable(errorParser: errorParser, queue: (queue ?? .main),
                                 completionHandler: completionHandler)
        }
}
