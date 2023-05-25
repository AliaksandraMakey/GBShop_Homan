//
//  ReviewsResult.swift
//  GBShop_Homan
//
//  Created by aaa on 24/05/2023.
//

import Foundation


//MARK: - Reviews Result
struct ReviewsResult: Codable {
    //TODO: - в store-api нет файла для всех Review. Обрабоать получение массива всех добавленых Review
    // properties
//    let result: Int
    let reviews: [Review]
}

