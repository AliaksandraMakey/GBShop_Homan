//
//  ReviewsTests.swift
//  GBShop_HomanTests
//
//  Created by aaa on 25/05/2023.
//

import XCTest
import Alamofire
@testable import GBShop_Homan

final class ReviewsTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Testing of ordering methods")
    var requestFactory: RequestFactory!
    var idUser: Int!
    var idReview: Int!
    var idProduct: Int!
    var reviewText: String!

    override func setUp() {
        requestFactory = RequestFactory()
        idUser = 1
        idReview = 1
        idProduct = 1
        reviewText = "New review"
    }

    override func tearDown() {
        idUser = nil
        idReview = nil
        idProduct = nil
        reviewText = nil
        requestFactory = nil
    }

//    func testGetReviews() {
//        let reviewsRequest = requestFactory.makeGetReviewsRequest()
//        reviewsRequest.getReviews(idProduct: idProduct) { response in
//            switch response.result {
//            case .success(let reviewResult):
//                self.checkReviewsResult(reviewResult)
//                break
//            case .failure(let error):
//                XCTFail("ReviewsTests: \(error.localizedDescription)")
//            }
//            self.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
    
//    private func checkReviewsResult(_ reviewResult: ReviewsResult) {
//        if reviewResult.result != 1 {
//            XCTFail("ReviewsTests: wrong response from server")
//        }
//    }

    func testAddReview() {
        let addReviewRequest = requestFactory.makeAddReviewRequest()
        addReviewRequest.addReview(idUser: idUser, idProduct: idProduct, text: reviewText) { response in
            switch response.result {
            case .success(let addReviewResult):
                self.checkAddReviewResult(addReviewResult)
                break
            case .failure(let error):
                XCTFail("ReviewsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkAddReviewResult(_ addReviewResult: AddReviewResult) {
        if addReviewResult.result != 1 {
            XCTFail("ReviewsTests: wrong response from server")
        }
        if addReviewResult.userMessage.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            XCTFail("ReviewsTests: response isn't correct")
        }
    }

    func testRemoveReview() {
        let removeReviewRequest = requestFactory.makeRemoveReviewRequest()
        removeReviewRequest.removeReview(id: idReview) { response in
            switch response.result {
            case .success(let removeReviewResult):
                self.checkRemoveReviewResult(removeReviewResult)
                break
            case .failure(let error):
                XCTFail("ReviewsTests: \(error.localizedDescription)")
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    private func checkRemoveReviewResult(_ removeReviewResult: RemoveReviewResult) {
        if removeReviewResult.result != 1 {
            XCTFail("ReviewsTests: wrong response from server")
        }
    }
}
