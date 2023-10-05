//
//  LoginViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    let requestFactory = RequestFactory()

    // MARK: - Properties
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

    private let signUpButton: BaseButtonView = {
        let buttonView = BaseButtonView(title: "Войти")
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()

    private let registerButton: BaseButtonView = {
        let buttonView = BaseButtonView(title:"Зарегестрироваться")
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()

    private let registerMessageLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Если вы еще не зарегистрированы, нажмите")
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9660630822, green: 0.6466907859, blue: 0.6625785232, alpha: 1)
        setupUI()
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        view.addSubview(registerButton)
        view.addSubview(registerMessageLabel)

        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            loginTextField.widthAnchor.constraint(equalToConstant: 300),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),

            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),

            registerMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerMessageLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20),

            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: registerMessageLabel.bottomAnchor, constant: 10)

        ])
    }
    // MARK: - Actions
    @objc private func signUpButtonTapped() {
//        let auth = requestFactory.makeAuthRequest()
//        auth.login(login: loginTextField.text ?? "",
//                   password: passwordTextField.text ?? "") { [weak self] response in
//            guard let self = self else { return }
//
//            switch response.result {
//            case .success(let login):
//                LocalStorageManager.shared.setRefreshToken(login.refreshToken)
//                LocalStorageManager.shared.setAccessToken(login.accessToken)
//                DispatchQueue.main.async {
                    let tabBarViewController = TabBarViewController()
                    tabBarViewController.modalPresentationStyle = .fullScreen
                    self.present(tabBarViewController, animated: true, completion: nil)
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    @objc private func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = .fullScreen
        self.present(registerViewController, animated: true, completion: nil)
    }
}
