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
    var requestFactory: RequestFactory!
    var idUser: Int!

    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 123
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        idUser = nil
    }

    func testLogout() {
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(idUser: idUser) { response in
            switch response.result {
            case .success(let logout):
                self.checkLogoutResult(logout)
                break
            case .failure(let error):
                XCTFail("LogoutTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }


    private func checkLogoutResult(_ logout: LogoutResult) {
        if logout.result != 1 {
            XCTFail("LogoutTests: wrong response from server")
        }
    }
}
