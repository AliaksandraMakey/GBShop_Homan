//
//  LogoutRequestFactory.swift
//  GBShop_Homan
//
//  Created by aaa on 18/05/2023.
//

import Alamofire
import Foundation

// MARK: - LogoutRequestFactory
protocol LogoutRequestFactory {
    /// logout function
    /// - Parameter completionHandler: AFDataResponse<Data> return HTTPStatus
    func logout(completionHandler: @escaping (AFDataResponse<Data>) -> Void)
}
