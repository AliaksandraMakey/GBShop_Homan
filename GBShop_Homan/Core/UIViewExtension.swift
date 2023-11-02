//
//  UIViewExtension.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 20.10.2023.
//

import UIKit

extension UIView {

    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
    }
}
