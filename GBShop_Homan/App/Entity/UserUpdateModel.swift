//
//  UserTestsModel.swift
//  GBShop_Homan
//
//  Created by aaa on 19/05/2023.
//

import Foundation

// MARK: - User Tests Model
struct UserUpdateModel {
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
    func createModelForLogout() -> UserUpdateModel {
        return UserUpdateModel(requestFactory: requestFactory, idUser: 123)
    }
    func createModelAuthentication() -> UserUpdateModel {
            return  UserUpdateModel(requestFactory: requestFactory, userName: userName, password: password)
    }
    func createModelForChangeProfile() -> UserUpdateModel {
        return UserUpdateModel(requestFactory: requestFactory,
                               idUser: idUser,
                               userName: userName,
                               password: password,
                               email: email,
                               gender: gender,
                               creditCard: creditCard,
                               bio: bio)
    }
}
