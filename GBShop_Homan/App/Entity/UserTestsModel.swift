//
//  UserTestsModel.swift
//  GBShop_Homan
//
//  Created by aaa on 19/05/2023.
//

import Foundation

//TODO: можете создать что-то типо TestsModel и там написать функции, которые будут возвращать готовую модель.

//MARK: - User Tests Model
struct UserTestsModel {
    // properties
    var requestFactory: RequestFactory!
    var idUser: Int!
    var userName: String!
    var password: String!
    var email: String!
    var gender: String!
    var creditCard: String!
    var bio: String!
    // creating model for tests User
    func createModelForLogout() -> UserTestsModel {
        return UserTestsModel(requestFactory: requestFactory, idUser: 123)
    }
    func createModelAuthentication() -> UserTestsModel {
            return  UserTestsModel(requestFactory: requestFactory, userName: userName, password: password)
    }
    func createModelForChangeProfile() -> UserTestsModel {
        return UserTestsModel(requestFactory: requestFactory,
                               idUser: idUser,
                               userName: userName,
                               password: password,
                               email: email,
                               gender: gender,
                               creditCard: creditCard,
                               bio: bio)
    }
}
