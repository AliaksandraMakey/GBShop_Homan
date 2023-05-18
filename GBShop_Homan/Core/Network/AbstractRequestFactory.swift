//
//  AbstractRequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Alamofire

//MARK: - protocol AbstractRequestFactory
protocol AbstractRequestFactory {
    /// properties
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue? { get }
    
    @discardableResult
    /// request
    func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}
//MARK: - extension AbstractRequestFactory
extension AbstractRequestFactory {
    @discardableResult
    /// request
    public func request<T: Decodable>(
        request: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
            
            return sessionManager
                .request(request)
                .responseCodable(errorParser: errorParser, queue: (queue ?? .main),
                                 completionHandler: completionHandler)
        }
}
