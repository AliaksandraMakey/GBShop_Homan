//
//  CatalogData.swift
//  GBShop_Homan
//
//  Created by aaa on 22/05/2023.
//

import Foundation
import Alamofire

//MARK: - Catalog Data
class CatalogData: AbstractRequestFactory {
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
extension CatalogData: CatalogDataRequestFactory {
    /// get product by ID and page number
    func getCatalogData(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void) {
        if baseUrl != nil {
            let requestModel = CatalogDataRouter(baseUrl: baseUrl!, pageNumber: pageNumber, idCategory: idCategory)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    }
}

extension CatalogData {
    //MARK: - Catalog Data Router
    struct CatalogDataRouter: RequestRouter {
        // properties
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number" : pageNumber,
                "id_category" : idCategory
            ]
        }
    }
}
