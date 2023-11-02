//
//  BaseImputTextView.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class BaseImputTextView: UIView {
    // MARK: - Properties
    var labelText: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    // MARK: - UI components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    // MARK: - Setup subviews
    private func setupViews() {
        addSubview(label)
        addSubview(textField)
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // label
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            // textField
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
