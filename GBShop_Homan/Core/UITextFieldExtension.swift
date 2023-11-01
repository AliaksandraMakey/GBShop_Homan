//
//  UITextFieldExtension.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 31.10.2023.
//

import UIKit

extension UITextField {
    func doubleValue() -> Double? {
        if let text = self.text, let balance = Double(text) {
            return balance
        } else {
            return nil
        }
    }
    func intValue() -> Int? {
        if let text = self.text, let balance = Int(text) {
            return balance
        } else {
            return nil
        }
    }
}
