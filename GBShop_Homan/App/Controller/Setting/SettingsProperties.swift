//
//  SettingsProperties.swift
//  GBShop_Homan
//
//  Created by aaa on 26/09/2023.
//

import UIKit

enum SettingProperties {
    case notificationUpdateCatalog,
         notificationAppearanceSaveGoods,
         notificationDiscount

    var itemLabel: String {
        switch self {
        case .notificationUpdateCatalog:
            return "Включить уведомления\nоб обновлении каталога"
        case .notificationAppearanceSaveGoods:
            return "Включить уведомления\nо появлении сохраненных товаров"
        case .notificationDiscount:
            return "Включить уведомления о скидках"
        }
    }
}
