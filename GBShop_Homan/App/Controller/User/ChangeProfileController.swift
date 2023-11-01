//
//  ChangeProfileController.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 24.10.2023.
//

import UIKit

class ChangeProfileController: UIViewController {
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
    private let updateUserDateButton = BaseButtonView(title: "Обновить данные", size: 20)
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
        updateUserDateButton.addTarget(self, action: #selector(updateUserDateButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(fullNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(updateUserDateButton)
        updateUserDateButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        let leadingMargin: CGFloat = 16.0
        let trailingMargin: CGFloat = 16.0
        NSLayoutConstraint.activate([
            // fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
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
            // registerButton
            updateUserDateButton.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 16),
            updateUserDateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    // MARK: - Actions
    @objc private func updateUserDateButtonTapped() {
        let profile = requestFactory.makeChangesProfileRequest()
        profile.changesProfile(fullName: fullNameTextField.text ?? "", gender: genderTextField.text ?? "", isAdmin: false) { response in
            switch response.response?.statusCode {
            case 201:
                self.showSuccessAlert()
            case 200:
                self.showSuccessAlert()
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
        alert.showSuccessUpdateProfileAlert(presenter: self)
    }
}
