//
//  RegisterViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    let requestFactory = RequestFactory()
    // MARK: - Properties
    private let fullNameLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Ваше ФИО")
        return label
    }()

    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let genderLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Ваш пол")
        return label
    }()
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let emailLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Email")
        return label
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let passwordLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Пароль")
        return label
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Не менее 8 символов"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let confirmPasswordLabel: BaseLabelView = {
        let label = BaseLabelView(text: "Повторите пароль")
        return label
    }()
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Не менее 8 символов"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let registerButton: BaseButtonView = {
        let buttonView = BaseButtonView(title: "Зарегестрироваться")
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9660630822, green: 0.6466907859, blue: 0.6625785232, alpha: 1)
        setupUI()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(fullNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(registerButton)

        let leadingMargin: CGFloat = 16.0
        let trailingMargin: CGFloat = 16.0

        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            genderLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            emailLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingMargin),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingMargin),

            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - Actions
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
                print("Пользователь не зарегестрирован, статус ошибки -\(statusCode)")
            default:
                print("Пользователь не зарегестрирован")
            }
        }
    }

    private func showSuccessAlert() {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: "Успешная регистрация", message: "На ваш электронный адрес должно прийти письмо с подтверждением вашей почты.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
                let loginViewController = LoginViewController()
                loginViewController.modalPresentationStyle = .fullScreen
                       self?.present(loginViewController, animated: true, completion: nil)
            }

            alertController.addAction(okAction)
            self?.present(alertController, animated: true, completion: nil)
        }
    }

    private func showEmailAlreadyExistsAlert() {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: "Предупреждение", message: "Пользователь с таким Email уже зарегестрирован.", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
                let loginViewController = LoginViewController()
                loginViewController.modalPresentationStyle = .fullScreen
                       self?.present(loginViewController, animated: true, completion: nil)
            }

            alertController.addAction(okAction)
            self?.present(alertController, animated: true, completion: nil)
        }
    }

}
