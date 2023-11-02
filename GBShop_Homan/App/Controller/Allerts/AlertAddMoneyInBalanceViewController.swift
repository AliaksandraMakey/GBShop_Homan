//
//  AlertAddMoneyInBalanceViewController.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 27.10.2023.
//

import UIKit

// TODO: - Сделать whiteView переиспользуемым компонентом
class AlertAddMoneyInBalanceViewController: UIViewController {
    // MARK: - Properties
    private let requestFactory = RequestFactory()
    // MARK: - UI components
    private let enterAmountLabel = BaseLabelView(text: "Введите сумму", size: 20, weight: .bold)
    private let amountTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Сумма"
        field.backgroundColor = .backgroundColor
        field.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        field.textAlignment = .center
        return field
    }()
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.backgroundColor = UIColor.white.withAlphaComponent(1.0)
        view.layer.cornerRadius = 10
        return view
    }()
    private let addButton = BaseButtonView(title: "Пополнить баланс", size: 20)
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.tintColor = UIColor.black
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = UIColor.mainWhite.withAlphaComponent(0.4)
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(whiteView)
        whiteView.addSubview(enterAmountLabel)
        whiteView.addSubview(amountTextField)
        whiteView.addSubview(addButton)
        whiteView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // whiteView
            whiteView.widthAnchor.constraint(equalToConstant: 250),
            whiteView.heightAnchor.constraint(equalToConstant: 250),
            whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // enterAmountLabel
            enterAmountLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20),
            enterAmountLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 15),
            enterAmountLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -15),
            enterAmountLabel.widthAnchor.constraint(equalToConstant: 60),
            enterAmountLabel.heightAnchor.constraint(equalToConstant: 60),
            // amountTextField
            amountTextField.topAnchor.constraint(equalTo: enterAmountLabel.bottomAnchor, constant: 20),
            amountTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            amountTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            amountTextField.widthAnchor.constraint(equalToConstant: 60),
            amountTextField.heightAnchor.constraint(equalToConstant: 60),
            // addButton
            addButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 15),
            addButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -15),
//            addButton.widthAnchor.constraint(equalToConstant: 44),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            // closeButton
            closeButton.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -5),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    // MARK: - Actions
    @objc func addButtonTapped() {
        getData(fieldData: amountTextField)
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    func getData(fieldData: UITextField) {
        let cashAccountRequest = requestFactory.makeAddCashAccount()
        if let newBalance = fieldData.doubleValue() {
            cashAccountRequest.addBalanceToCashAccount(balance: newBalance, completionHandler: {  [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success:
                    DispatchQueue.main.async {
                        let alertBalanceViewController = AlertBalanceViewController()
                        alertBalanceViewController.modalPresentationStyle = .fullScreen
                        self.present(alertBalanceViewController, animated: true, completion: nil)
                    }
                case .failure(let error):
                    print("Failed to load cash account balance data: \(error)")
                }
            })
        }
    }
}
