//
//  ExpandableLabel.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 25.10.2023.
//

import UIKit

final class ExpandableLabel: UILabel {
    // MARK: - Properties
    private var isExpanded = false
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    // MARK: - setup UI components
    private func setupUI() {
        textColor = .black
        font = UIFont.systemFont(ofSize: 16)
        numberOfLines = 1
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        addGestureRecognizer(tapGesture)
    }
    // MARK: - Actions
    @objc private func labelTapped() {
        isExpanded.toggle()
        numberOfLines = isExpanded ? 0 : 1
    }
}
