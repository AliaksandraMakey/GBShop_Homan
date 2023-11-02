//
//  BaseRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import Alamofire

class BaseRequestFactory: AbstractRequestFactory {
   /// The error parser used for handling errors in responses.
   let errorParser: AbstractErrorParser
   /// The session manager responsible for network requests.
   let sessionManager: Session
   /// The dispatch queue for handling request completion blocks.
   let queue: DispatchQueue?
   /// The base URL for the request factory.
   let baseUrl = URL(string: "http://localhost:8080")
   /// Initializes a base request factory with the provided error parser, session manager, and queue.
   ///
   /// - Parameters:
   ///   - errorParser: The error parser used for handling errors in responses.
   ///   - sessionManager: The session manager responsible for network requests.
   ///   - queue: The dispatch queue for handling request completion blocks. Default is a utility global queue.
   init(errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
       self.errorParser = errorParser
       self.sessionManager = sessionManager
       self.queue = queue
   }
    func addTokenToRequest(requestModel: URLRequestConvertible) -> URLRequest {
        var headers = HTTPHeaders()
        let accessToken = LocalStorageManager.shared.getAccessTokenString()
            headers.add(HTTPHeader.authorization(bearerToken: accessToken))

        var request = try? requestModel.asURLRequest()
        request?.headers = headers

        return request!
    }
    func processResponse(response: AFDataResponse<Data?>, completionHandler: @escaping (Result<Void, Error>) -> Void) {
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    if 200...299 ~= statusCode {
                        completionHandler(.success(()))
                    } else if statusCode == 401 {
                        completionHandler(.failure(APIError.unauthorized))
                    } else if statusCode == 400 {
                        completionHandler(.failure(APIError.badRequest))
                    } else if statusCode == 404 {
                        completionHandler(.failure(APIError.notFound))
                    } else if statusCode == 500 {
                        completionHandler(.failure(APIError.serverError))
                    } else {
                        completionHandler(.failure(APIError.other(statusCode)))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
}
