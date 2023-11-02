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
    var model: User!
    var requestFactory: RequestFactory!

    override func setUp() {
        model = User(id: UUID(), fullName: "John Doe", email: "john@example.com", isAdmin: false, gender: "Male")
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        model = nil
        requestFactory = nil
    }

    func testLogout() {
        let logout = requestFactory.makeLogoutRequest()
        logout.logout { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                XCTFail("LogoutTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
