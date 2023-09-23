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
    var model: UserUpdateModel!
    
    override func setUp() {
        model = UserUpdateModel(requestFactory: RequestFactory(),
                           idUser: 123,
                           userName: "Aliaks",
                           password: "geekbrains",
                           email: "Aliaksandra.makey@gmail.com",
                           gender: "f",
                           creditCard: "1234-5678-1234-5678",
                           bio: "Some text")
    }
    
    override func tearDown() {
        model.requestFactory = nil
        model.idUser = nil
        model.userName = nil
        model.password = nil
        model.email = nil
        model.gender = nil
        model.creditCard = nil
        model.bio = nil
    }
    
    func testLogout() {
        let profile = model.requestFactory.makeChangesProfileRequest()
        profile.changesProfile(idUser: model.idUser,
                               userName: model.userName,
                               password: model.password,
                               email: model.email,
                               gender: model.gender,
                               creditCard: model.creditCard,
                               bio: model.bio) { response in
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
