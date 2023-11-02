//
//  AlertBalanceViewController.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 26.10.2023.
//

import UIKit

class AlertBalanceViewController: UIViewController {
    // MARK: - Properties
    private let requestFactory = RequestFactory()
    var moneyValue: Double = 0.0 {
        didSet {
            moneyTextField.text = String(format: "%.2f", moneyValue)
        }
    }
    // MARK: - UI components
    private let balanceLabel = BaseLabelView(text: "На вашем счету", size: 16, weight: .bold)
    private lazy var moneyTextField: BaseLabelView = {
        let moneyText = "\(moneyValue)"
        return BaseLabelView(text: moneyText, size: 16, weight: .bold)
    }()
    private let closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "multiply.circle.fill")
        button.setImage(image, for: .normal)
        
        button.tintColor = UIColor.black
        return button
    }()
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.backgroundColor = UIColor.white.withAlphaComponent(1.0)
        view.layer.cornerRadius = 10
        return view
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        view.backgroundColor = UIColor.mainWhite.withAlphaComponent(0.4)
        setupViews()
        setupConstraints()
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(whiteView)
        whiteView.addSubview(balanceLabel)
        whiteView.addSubview(moneyTextField)
        whiteView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        whiteView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // whuteView
            whiteView.widthAnchor.constraint(equalToConstant: 200),
            whiteView.heightAnchor.constraint(equalToConstant: 200),
            whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // balanceLabel
            balanceLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10),
            balanceLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            balanceLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            // moneyTextField
            moneyTextField.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 10),
            moneyTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            moneyTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            // closeButton
            closeButton.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    // MARK: - Actions
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    func getData() {
        let cashAccountRequest = requestFactory.makeCashAccountBalance()
        cashAccountRequest.getBalanceFromCashAccount { result in
            switch result {
            case .success(let cashAccount):
                self.moneyValue = cashAccount.balance
                self.moneyValue = cashAccount.balance
            case .failure(let error):
                print("Failed to load cash account balance data: \(error)")
            }
        }
    }
}
