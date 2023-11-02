//
//  ChangeProfileTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 18/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

class ChangeProfileTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Change profiling test")
    var requestFactory: RequestFactory!
    
    override func setUp() {
        requestFactory = RequestFactory()
    }
    
    override func tearDown() {
        requestFactory = nil
    }
    
    func testChangeProfile() {
        let profileRequest = requestFactory.makeChangesProfileRequest()
        let fullName = "Updated Full Name"
        let gender = "F"
        let isAdmin = true
        
        profileRequest.changesProfile(fullName: fullName, gender: gender, isAdmin: isAdmin) { response in
            switch response {
            case .success:
                // The request was successful, no further action needed.
                break
            case .failure(let error):
                XCTFail("ChangeProfileTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
