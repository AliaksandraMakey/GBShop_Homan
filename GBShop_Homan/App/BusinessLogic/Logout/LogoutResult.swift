//
//  LogoutResult.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation

//MARK: - LogoutResult
struct LogoutResult: Codable {
    /// properties
    let idUser: Int
    let result: Int
    let user: User
}
