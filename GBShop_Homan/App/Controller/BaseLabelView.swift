//
//  BaseLabelView.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class BaseLabelView: UILabel {
    init(text: String?) {
        super.init(frame: .zero)
        self.text = text
        textColor = .black
        font = UIFont.systemFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
