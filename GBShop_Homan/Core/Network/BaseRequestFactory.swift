//
//  BaseRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import Alamofire

class BaseRequestFactory: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    let baseUrl = URL(string: "http://localhost:8080")
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
