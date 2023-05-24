//
//  ChangesProfile.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation
import Alamofire

//MARK: - Changes Profile
class ChangesProfile: AbstractRequestFactory {
    // properties
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue?
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")

    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
/// subscription ChangesProfileRequestFactory
extension ChangesProfile: ChangesProfileRequestFactory {
    func changesProfile(idUser: Int,
                       userName: String,
                       password: String,
                       email: String,
                       gender: String,
                       creditCard: String,
                       bio: String,
                        completionHandler: @escaping (AFDataResponse<ChangesProfileResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = ChangesProfileRouter(baseUrl: baseUrl!, idUser: idUser, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}
extension ChangesProfile {
    //MARK: - Changes Profile Router
    struct ChangesProfileRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let idUser: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user" : idUser,
                "username" : userName,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
