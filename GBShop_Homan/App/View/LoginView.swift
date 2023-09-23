////
////  LoginView.swift
////  GBShop_Homan
////
////  Created by aaa on 18/09/2023.
////
//
// import Foundation
// import UIKit
//
// final class LoginView: UIView {
//    // MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .white
//        self.setupLayout()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setupLayout()
//    }
//    // MARK: - Properties
//    private let loginTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Login"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    private let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Password"
//        textField.borderStyle = .roundedRect
//        textField.isSecureTextEntry = true
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    private let signUpButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Sign Up", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    // MARK: - UI Setup
//    private func setupLayout() {
//        self.addSubview(loginTextField)
//        self.addSubview(passwordTextField)
//        self.addSubview(signUpButton)
//        NSLayoutConstraint.activate([
//            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
//            loginTextField.widthAnchor.constraint(equalToConstant: 200),
//            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
//            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
//            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
//        ])
//    }
//
// }
