//
//  RequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//
import Alamofire
import Foundation

// MARK: - Request Factory
class RequestFactory {
    // properties
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)
    var errorParser: AbstractErrorParser {
        return ErrorParser()
    }
    /// Make Auth Request Error Parser
    func makeAuthRequest() -> AuthRequestFactory {
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }
    /// Make Logout Request
    func makeLogoutRequest() -> LogoutRequestFactory {
        return Logout(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    /// Make ChangesProfile Request
    func makeChangesProfileRequest() -> ChangesProfileRequestFactory {
        return ChangesProfile(errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue)
    }
    /// Make CatalogData Request
    func makeCatalogDataRequest() -> CatalogDataRequestFactory {
        return CatalogData(errorParser: errorParser,
                           sessionManager: commonSession,
                           queue: sessionQueue)
    }
    /// Make Product Request
    func makeProductRequest() -> ProductRequestFactory {
        return ProductRequest(errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue)
    }
    /// Make Reviews Request
    func makeGetReviewsRequest() -> ReviewsRequestFactory {
        return ReviewsRequest(errorParser: errorParser,
                              sessionManager: commonSession,
                              queue: sessionQueue)
    }
    /// Make Add Reviews Request
    func makeAddReviewRequest() -> AddReviewRequestFactory {
        return AddReviewRequest(errorParser: errorParser,
                                sessionManager: commonSession,
                                queue: sessionQueue)
    }
    /// Make Remove Reviews Request
    func makeRemoveReviewRequest() -> RemoveReviewRequestFactory {
        return RemoveReviewRequest(errorParser: errorParser,
                                   sessionManager: commonSession,
                                   queue: sessionQueue)
    }
}
