//
//  AuthTest.swift
//  GBShop_HomanTests
//
//  Created by aaa on 18/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan


final class AuthTest: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Test for function login")
    var requestFactory: RequestFactory!
    var userName: String!
    var password: String!
    
    override func setUp() {
        requestFactory = RequestFactory()
        userName = "Somebody"
        password = "mypassword"
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        userName = nil
        password = nil
    }
    
    func testAuth() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let login):
                self.checkAuthResult(login)
                break
            case .failure(let error):
                XCTFail("LoginTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    private func checkAuthResult(_ login: AuthResult) {
        if login.result != 1 {
            XCTFail("LoginTests: wrong response from server")
        }
        if login.user.id < 1 {
            XCTFail("LoginTests: id ")
        }
        if login.user.login.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            XCTFail("LoginTests: Login doesn't found")
        }
    }
}
