//
//  LocalStorageManager.swift
//  GBShop_Homan
//
//  Created by aaa on 15/09/2023.
//

import Foundation
import KeychainSwift

/// A singleton manager for securely storing and retrieving access and refresh tokens using KeychainSwift.
class LocalStorageManager {
    
    /// The shared instance of `LocalStorageManager`.
    static let shared = LocalStorageManager()
    
    private let keychain = KeychainSwift()
    
    private let accessTokenKey = "access_token"
    private let refreshTokenKey = "refresh_token"
    
    /// Private initializer to ensure a single shared instance.
    private init() {}
    
    /// Sets the access token in the Keychain storage.
    ///
    /// - Parameter accessToken: The access token to be stored.
    func setAccessToken(_ accessToken: String) {
        keychain.set(accessToken, forKey: accessTokenKey)
    }
    
    /// Sets the refresh token in the Keychain storage.
    ///
    /// - Parameter refreshToken: The refresh token to be stored.
    func setRefreshToken(_ refreshToken: String) {
        keychain.set(refreshToken, forKey: refreshTokenKey)
    }
    
    /// Retrieves the access token from Keychain storage.
    ///
    /// - Returns: The access token, or `nil` if not found.
    func getAccessToken() -> String? {
        return keychain.get(accessTokenKey)
    }
    
    /// Retrieves the access token from Keychain storage as a non-optional string.
    ///
    /// - Returns: The access token as a non-optional string. If not found, an empty string is returned.
    func getAccessTokenString() -> String {
        return keychain.get(accessTokenKey) ?? ""
    }
    
    /// Retrieves the refresh token from Keychain storage.
    ///
    /// - Returns: The refresh token, or `nil` if not found.
    func getRefreshToken() -> String? {
        return keychain.get(refreshTokenKey)
    }
    
    /// Retrieves the refresh token from Keychain storage as a non-optional string.
    ///
    /// - Returns: The refresh token as a non-optional string. If not found, an empty string is returned.
    func getRefreshTokenString() -> String {
        return keychain.get(refreshTokenKey) ?? ""
    }
    
    /// Clears both access and refresh tokens from Keychain storage.
    func clearPairOfTokens() {
        keychain.delete(accessTokenKey)
        keychain.delete(refreshTokenKey)
    }
}
