//
//  LogoutRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Foundation
import Alamofire

//MARK: - LogoutRequestFactory
protocol LogoutRequestFactory {
    /// logout
    func logout(idUser: Int,
                 completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
