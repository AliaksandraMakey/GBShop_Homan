//
//  TableViewCell.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 26.10.2023.
//

import UIKit

// TODO: - сделать кастомным элементом  incrementButton и decrementButton
// TODO: - сделать картинки на бэке и добавить метод конвертации
class TableViewCell: UITableViewCell, UITextFieldDelegate {
    // MARK: - Properties
    weak var delegate: CustomTableCellDelegate?
    var indexPath: IndexPath?
    static let reuseIdentifier = "TableViewCell"
    // MARK: - UI components
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.backgroundButtonColor.cgColor
        return imageView
    }()
    private let productNameLabel = BaseLabelView()
    private let priceLabel = BaseLabelView(text: nil, size: 12, weight: .bold)
    private let quantityLabel = BaseLabelView(text: "Кол-во")
    private let quantityTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    private let incrementButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .backgroundButtonColor
        button.layer.cornerRadius = 2
        button.tintColor = .mainWhite
        return button
    }()
    private let decrementButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .backgroundButtonColor
        button.layer.cornerRadius = 2
        button.tintColor = .mainWhite
        return button
    }()
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func configure(with product: BasketProduct) {
        productImageView.image = UIImage(systemName: product.product.image)
        productNameLabel.text = product.product.name
        priceLabel.text = "Цена: \(String(product.product.price)) byn"
        quantityTextField.text = String(product.quantity)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        quantityTextField.delegate = self
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        decrementButton.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        incrementButton.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(priceLabel)
        addSubview(quantityLabel)
        contentView.addSubview(decrementButton)
        contentView.addSubview(incrementButton)
        contentView.addSubview(quantityTextField)

        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // productImageView
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            // productNameLabel
            productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8),
            productNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            productNameLabel.widthAnchor.constraint(equalToConstant: 180),
            productNameLabel.heightAnchor.constraint(equalToConstant: 50),
            // priceLabel
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 6),
            priceLabel.widthAnchor.constraint(equalToConstant: 130),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            // quantityLabel
            quantityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            quantityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            // quantityTextField
            quantityTextField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 0),
            quantityTextField.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            quantityTextField.widthAnchor.constraint(equalToConstant: 50),
            quantityTextField.heightAnchor.constraint(equalToConstant: 36),
            // decrementButton
            decrementButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            decrementButton.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 4),
            decrementButton.widthAnchor.constraint(equalToConstant: 25),
            decrementButton.heightAnchor.constraint(equalToConstant: 25),
            // incrementButton
            incrementButton.trailingAnchor.constraint(equalTo: decrementButton.leadingAnchor, constant: -6),
            incrementButton.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 4),
            incrementButton.widthAnchor.constraint(equalToConstant: 25),
            incrementButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    // MARK: - Actions
    @objc private func decrementButtonTapped() {
        delegate?.didDecrementQuantity(at: indexPath)
    }
    @objc private func incrementButtonTapped() {
        delegate?.didIncrementQuantity(at: indexPath)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let newQuantity = textField.intValue() {
            delegate?.didUpdateQuantity(newQuantity, at: indexPath)
        }
    }
    @objc private func removeButtonTapped() {
        delegate?.didRemoveItem(at: indexPath)
    }
}
