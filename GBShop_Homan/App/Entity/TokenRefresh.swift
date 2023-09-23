//
//  TokenRefresh.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation

 struct TokenRefresh: Codable {

    public var refresh: String
    public var access: String

    public init(refresh: String, access: String) {
        self.refresh = refresh
        self.access = access
    }
}
