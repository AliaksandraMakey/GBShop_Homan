//
//  AuthResult.swift
//  GBShop
//
//  Created by aaa on 12/05/2023.
//

import Foundation

struct AuthResult: Codable {
    let accessToken: String
    let refreshToken: String
    let user: User

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        self.user = try container.decode(User.self, forKey: .user)
    }
}
