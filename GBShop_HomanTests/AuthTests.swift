//
//  AuthTest.swift
//  GBShop_HomanTests
//
//  Created by aaa on 18/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

    class AuthTest: XCTestCase {

        let expectation = XCTestExpectation(description: "Test for function login")
        var requestFactory: RequestFactory!
        
        let expectedUserID: UUID = UUID() 

        override func setUp() {
            requestFactory = RequestFactory()
        }

        override func tearDown() {
            requestFactory = nil
        }

        func testAuth() {
            let authRequest = requestFactory.makeAuthRequest()
            let userName = "Somebody"
            let password = "mypassword"

            authRequest.login(login: userName, password: password) { response in
                switch response.result {
                case .success(let authResult):
                    self.checkAuthResult(authResult)
                case .failure(let error):
                    XCTFail("AuthTest: \(error.localizedDescription)")
                }
                self.expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        }

        private func checkAuthResult(_ authResult: AuthResult) {
            XCTAssertEqual(authResult.user.id, expectedUserID, "AuthTest: unexpected user ID")
        }
    }
