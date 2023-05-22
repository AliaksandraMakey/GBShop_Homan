//
//  ChangeProfileTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 18/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

final class ChangeProfileTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Change profiling test")
    var requestFactory: RequestFactory!
    var idUser: Int!
    var userName: String!
    var password: String!
    var email: String!
    var gender: String!
    var creditCard: String!
    var bio: String!
    
    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 123
        userName = "Aliaks"
        password = "geekbrains"
        email = "Aliaksandra.makey@gmail.com"
        gender = "f"
        creditCard = "1234-5678-1234-5678"
        bio = "Some text"
    }
    
    override func tearDown() {
        requestFactory = nil
        idUser = nil
        userName = nil
        password = nil
        email = nil
        gender = nil
        creditCard = nil
        bio = nil
    }
    
    func testLogout() {
        let profile = requestFactory.makeChangesProfileRequestFatory()
        profile.changesProfile(idUser: idUser,
                              userName: userName,
                              password: password,
                              email: email,
                              gender: gender,
                              creditCard: creditCard,
                              bio: bio) { response in
            switch response.result {
            case .success(let profile):
                self.checkChangeProfileResult(profile)
            case .failure(let error):
                XCTFail("ChangeProfileTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    private func checkChangeProfileResult(_ profile: ChangesProfileResult) {
        if profile.result != 1 {
            
            XCTFail("ChangeProfileTests: wrong response from server")
        }
    }
}
