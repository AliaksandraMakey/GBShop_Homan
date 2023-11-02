//
//  BaseButtonView.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

final class BaseButtonView: UIView {
    // MARK: - UI components
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .backgroundButtonColor
        button.layer.cornerRadius = 10.0
        button.titleEdgeInsets = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        button.widthAnchor.constraint(equalToConstant: 250 + 16).isActive = true
        button.heightAnchor.constraint(equalToConstant: 16 + 16).isActive = true
        return button
    }()
    // MARK: - Lifecycle
    init(title: String) {
        super.init(frame: .zero)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle(title, for: .normal)
        setupViews()
        setupConstraints()
        setupTouchAnimations()
    }
    init(title: String, size: CGFloat) {
        super.init(frame: .zero)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: size)
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
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
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
