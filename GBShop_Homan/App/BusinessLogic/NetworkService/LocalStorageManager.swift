//
//  LocalStorageManager.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation
import KeychainSwift

class LocalStorageManager {
    static let shared = LocalStorageManager()
    private let keychain = KeychainSwift()

    private let accessTokenKey = "access_token"
    private let refreshTokenKey = "refresh_token"

    private init() {}

    func setAccessToken(_ accessToken: String) {
        keychain.set(accessToken, forKey: accessTokenKey)
    }

    func getAccessToken(completion: @escaping (String?) -> String?) {
        let accessToken = keychain.get(accessTokenKey)
        completion(accessToken)
    }
    func getAccessTokenString() -> String {
        return keychain.get(accessTokenKey) ?? ""
    }
    func getRefreshTokenString() -> String {
        return keychain.get(refreshTokenKey) ?? ""
    }

    func setRefreshToken(_ refreshToken: String) {
        keychain.set(refreshToken, forKey: refreshTokenKey)
    }

    func getRefreshToken(completion: @escaping (String?) -> Void) {
        let refreshToken = keychain.get(refreshTokenKey)
        completion(refreshToken)
    }

    func clearPairOfTokens() {
            keychain.delete(accessTokenKey)
            keychain.delete(refreshTokenKey)
        }
}
