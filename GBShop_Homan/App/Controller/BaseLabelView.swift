//
//  BaseLabelView.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class BaseLabelView: UILabel {
    // MARK: - Lifecycle
    init(text: String?, size: CGFloat, weight: UIFont.Weight) {
        super.init(frame: .zero)
        self.text = text
        textColor = .black
        font = UIFont.systemFont(ofSize: size, weight: weight)
        translatesAutoresizingMaskIntoConstraints = false
    }
    init(text: String?) {
        super.init(frame: .zero)
        self.text = text
        textColor = .black
        numberOfLines = 4
        font = UIFont.systemFont(ofSize: 16)
        translatesAutoresizingMaskIntoConstraints = false
    }
    init() {
        super.init(frame: .zero)
        self.text = text
        textColor = .black
        font = UIFont.systemFont(ofSize: 16)
       numberOfLines = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
