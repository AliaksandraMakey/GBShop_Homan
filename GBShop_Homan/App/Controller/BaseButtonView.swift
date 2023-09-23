//
//  BaseButtonView.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class BaseButtonView: UIView {

        private let button: UIButton = {
            let button = UIButton()
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            button.layer.cornerRadius = 10.0
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            button.titleEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            button.showsTouchWhenHighlighted = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 250 + 16).isActive = true
               button.heightAnchor.constraint(equalToConstant: 16 + 16).isActive = true

            return button
        }()

        init(title: String) {
            super.init(frame: .zero)
            button.setTitle(title, for: .normal)
            setupUI()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupUI() {
            addSubview(button)

            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: topAnchor),
                button.leadingAnchor.constraint(equalTo: leadingAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }

        func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
            button.addTarget(target, action: action, for: controlEvents)
        }
    }
