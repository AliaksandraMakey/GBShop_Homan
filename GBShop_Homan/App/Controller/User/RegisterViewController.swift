//
//  RegisterViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

// TODO: - сделать UITextField кастомным и переиспользовать
class RegisterViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    // MARK: - UI components
    private let fullNameLabel = BaseLabelView(text: "Ваше ФИО")
    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let genderLabel = BaseLabelView(text: "Ваш пол")
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let emailLabel = BaseLabelView(text: "Email")
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let passwordLabel = BaseLabelView(text: "Пароль")
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Не менее 8 символов"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let confirmPasswordLabel = BaseLabelView(text: "Повторите пароль")
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Не менее 8 символов"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let registerButton = BaseButtonView(title: "Зарегестрироваться", size: 20)
    private let backButton = BaseButtonView(title: "Назад", size: 20)
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
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(fullNameLabel)
        fullNameLabel.addShadow()
        view.addSubview(fullNameTextField)
        fullNameTextField.addShadow()
        view.addSubview(genderLabel)
        genderLabel.addShadow()
        view.addSubview(genderTextField)
        genderTextField.addShadow()
        view.addSubview(emailLabel)
        emailLabel.addShadow()
        view.addSubview(emailTextField)
        emailTextField.addShadow()
        view.addSubview(passwordLabel)
        passwordLabel.addShadow()
        view.addSubview(passwordTextField)
        passwordTextField.addShadow()
        view.addSubview(confirmPasswordLabel)
        confirmPasswordLabel.addShadow()
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.addShadow()
        view.addSubview(registerButton)
        view.addSubview(backButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        let leadingMargin: CGFloat = 16.0
        let trailingMargin: CGFloat = 16.0
        NSLayoutConstraint.activate([
            // fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // fullNameTextField
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // genderLabel
            genderLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // genderTextField
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // emailLabel
            emailLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // emailTextField
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // passwordLabel
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // confirmPasswordLabel
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // confirmPasswordTextField
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),
            // registerButton
            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 60),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // backButton
            backButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 16),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    // MARK: - Actions
    @objc private func backButtonTapped() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }

    @objc private func registerButtonTapped() {
        let profile = requestFactory.makeRegisterRequest()
        profile.register(fullName: fullNameTextField.text ?? "",
                         email: emailTextField.text ?? "",
                         gender: genderTextField.text ?? "",
                         password: passwordTextField.text ?? "",
                         confirmPassword: confirmPasswordTextField.text ?? "") { response in
            switch response.response?.statusCode {
            case 201:
                self.showSuccessAlert()
            case 409:
                self.showEmailAlreadyExistsAlert()
            case let statusCode?:
                print("User is not registered, error status - \(statusCode)")
            default:
                print("User is not registered")
            }
        }
    }
    // MARK: - Allerts
    private func showSuccessAlert() {
        let alert = Alerts()
        alert.showSuccessRegistrationAlert(presenter: self)
    }

    private func showEmailAlreadyExistsAlert() {
        let alert = Alerts()
        alert.showEmailAlreadyExistsAlert(presenter: self)
    }
}
