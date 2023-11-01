//
//  RequestFactory.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//
import Alamofire
import Foundation

/// Factory for creating network request factories.
class RequestFactory {
    /// Common session for performing network requests.
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        return Session(configuration: configuration)
    }()
    /// Queue for network requests.
    let sessionQueue = DispatchQueue.global(qos: .utility)
    /// Error parser for handling errors in network responses.
    var errorParser: AbstractErrorParser {
        return ErrorParser()
    }
    // MARK: - Request Factories
    /// Factory method to create an authentication request.
    func makeAuthRequest() -> AuthRequestFactory {
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a registration request.
    func makeRegisterRequest() -> RegisterResultFactory {
        return Register(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a logout request.
    func makeLogoutRequest() -> LogoutRequestFactory {
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a profile changes request.
    func makeChangesProfileRequest() -> ChangesProfileRequestFactory {
        return ChangesProfileRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for adding cash to the user's account.
    func makeAddCashAccount() -> AddCashAccountRequestFactory {
        return AddBalanceCashAccountRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for checking the balance of the user's cash account.
    func makeCashAccountBalance() -> BalanceCashAccountRequestFactory {
        return BalanceCashAccountRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for retrieving catalog data.
    func makeCatalogDataRequest() -> CatalogDataRequestFactory {
        return CatalogDataRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for getting all products in the user's basket.
    func makeGetAllBasketProductRequestFatory() -> GetAllBasketProductsRequestFactory {
        return GetAllBasketProductsRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for changing the quantity of products in the user's basket.
    func makeChangeQuantityProduct() -> ChangeQuantityProductRequestFactory {
        return ChangeQuantityProductRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for deleting a product from the user's basket.
    func makeDeleteProductFromBasket() -> DeleteProductFromBasketRequestFactory {
        return DeleteProductFromBasketRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    /// Factory method to create a request for adding a product to the user's basket.
    func makeAddProductToBasket() -> AddProductToBasketRequestFactory {
        return AddProductToBasketRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

}
