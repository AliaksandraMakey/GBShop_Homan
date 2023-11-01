//
//  BaseLineView.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 10.10.2023.
//

import UIKit

class BaseLineView: UIView {
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        backgroundColor = .backgroundButtonColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
