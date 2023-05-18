//
//  RequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//
import Foundation
import Alamofire

//MARK: - RequestFactory
class RequestFactory {
    /// properties
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)
    /// makeErrorParser
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    /// metod makeAuthRequestFatory
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessionManager: commonSession,
                    queue: sessionQueue)
    }
    /// metod makeLogoutRequestFatory
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser,
                      sessionManager: commonSession,
                      queue: sessionQueue)
    }
    /// metod makeChangesProfileRequestFatory
    func makeChangesProfileRequestFatory() -> ChangesProfileRequestFactory {
        
        let errorParser = makeErrorParser()
        
        return ChangesProfile(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
