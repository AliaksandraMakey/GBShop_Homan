//
//  LogoutTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 18/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

class LogoutTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Test for function logout")
    var model: UserUpdateModel!
    
    override func setUp() {
        model = UserUpdateModel(requestFactory: RequestFactory(), idUser: 123)
    }
    
    override func tearDownWithError() throws {
        model.requestFactory = nil
        model.idUser = nil
    }
    
    func testLogout() {
        let logout = model.requestFactory.makeLogoutRequest()
        logout.logout { response in
            if let statusCode = response.response?.statusCode {
                self.checkLogoutResult(LogoutResult(status: String(statusCode)))
            } else {
                XCTFail("LogoutTests: statusCode is nil")
            }        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    private func checkLogoutResult(_ logout: LogoutResult) {
        if logout.status != "200" {
            XCTFail("LogoutTests: wrong response from server")
        }
    }
}
