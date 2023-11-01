//
//  NetworkService.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation
import Alamofire

/// A service for making network requests to an API using Alamofire.
 class NetworkService: AbstractRequestFactory {
    // MARK: - Properties
    /// An error parser for handling errors in network responses.
    let errorParser: AbstractErrorParser
    /// The session manager used for making network requests.
    let sessionManager: Session
    /// A dispatch queue to specify the quality of service for network requests.
    let queue: DispatchQueue?
    /// The base URL for the API requests.
    let baseUrl = URL(string: "http://localhost:8080")
    /// Initializes a new instance of `NetworkService`.
    ///
    /// - Parameters:
    ///   - errorParser: An error parser for handling errors in network responses.
    ///   - interceptor: An optional request interceptor for modifying network requests.
    ///   - queue: An optional dispatch queue to specify the quality of service for network requests.
     init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
             self.errorParser = errorParser
             self.sessionManager = sessionManager
             self.queue = queue
         }
 }
