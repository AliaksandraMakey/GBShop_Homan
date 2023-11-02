//
//  TransparentButtonView.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 26.10.2023.
//

import UIKit

class TransparentButtonView: UIButton {
    // MARK: - UI components
    private let button: UIButton = {
           let button = UIButton()
        button.backgroundColor = UIColor(white: 0.9, alpha: 0.9)
           button.setTitleColor(.backgroundButtonColor, for: .normal)
           button.titleEdgeInsets = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
           button.layer.borderWidth = 0
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    // MARK: - Lifecycle
    init(title: String, size: CGFloat) {
        super.init(frame: .zero)
        button.setTitle(title, for: .normal)
        setupViews()
        setupConstraints()
        setupTouchAnimations()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup subviews
    private func setupViews() {
        addSubview(button)
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    // MARK: - Setup actions
    private func setupTouchAnimations() {
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUpOutside), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDragExit), for: .touchDragExit)
    }
    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        button.addTarget(target, action: action, for: controlEvents)
    }
    // MARK: - Actions
    @objc private func buttonTouchDown() {
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    @objc private func buttonTouchUpOutside() {
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform.identity
        })
    }
    @objc private func buttonTouchUpInside() {
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform.identity
        })
    }
    @objc private func buttonTouchDragExit() {
        UIView.animate(withDuration: 0.1, animations: {
            self.button.transform = CGAffineTransform.identity
        })
    }
}
