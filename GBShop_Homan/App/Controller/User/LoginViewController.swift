//
//  LoginViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    // MARK: - UI components
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let signUpButton = BaseButtonView(title: "Войти", size: 20)
    private let registerButton = BaseButtonView(title: "Зарегестрироваться", size: 20)
    private let registerMessageLabel = BaseLabelView(text: "Если вы еще не зарегистрированы, нажмите")
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstraints()
        setupActions()
     }
    // MARK: - Setup actions
    private func setupActions() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(registerButton)
        view.addSubview(registerMessageLabel)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // loginTextField
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            loginTextField.widthAnchor.constraint(equalToConstant: 300),
            // passwordTextField
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            // signUpButton
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            // registerMessageLabel
            registerMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerMessageLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),
            // registerButton
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: registerMessageLabel.bottomAnchor, constant: 10)
        ])
    }
    // MARK: - Actions
    @objc private func signUpButtonTapped() {
        let auth = requestFactory.makeAuthRequest()
        // FIXME: обработать пустые поля
        auth.login(login: loginTextField.text ?? "",
                   password: passwordTextField.text ?? "") { [weak self] response in
            guard let self = self else { return }

            switch response.result {
            case .success(let login):
                LocalStorageManager.shared.setRefreshToken(login.refreshToken)
                LocalStorageManager.shared.setAccessToken(login.accessToken)
                DispatchQueue.main.async {
                    let tabBarViewController = TabBarViewController()
                    tabBarViewController.modalPresentationStyle = .fullScreen
                    self.present(tabBarViewController, animated: true, completion: nil)
                }
            case .failure(let error):
                print("Failed to sign Up: \(error)")
            }
        }
    }
    @objc private func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = .fullScreen
        self.present(registerViewController, animated: true, completion: nil)
    }
}
