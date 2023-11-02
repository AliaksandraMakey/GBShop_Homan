//
//  ProductView.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 15.10.2023.
//

import UIKit

// TODO: - сделать картинки на бэке (сделать коллецию разноразмерную с возможностью нажатия) и добавить метод конвертации
class ProductView: UIView {
    // MARK: - Properties
    weak var delegate: ProductViewDelegate?
    private var productID: UUID?
    private var isFavorite = false
    // MARK: - UI components
    private let nameLabel = BaseLabelView()
    private let priceLabel = BaseLabelView()
    private let ratingTextLabel = BaseLabelView(text: "Оценка пользователей", size: 14, weight: .bold)
    private let ratingLabel = BaseLabelView()
    private let statusLabel = BaseLabelView()
    private let discriptionTextLabel = BaseLabelView(text: "Описание", size: 16, weight: .bold)
    private let descriptionLabel = BaseLabelView()
    private let addBusket = BaseButtonView(title: "Добавить в корзину", size: 10)
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.sizeThatFits(CGSize(width: 50, height: 50))
        button.tintColor = .backgroundButtonColor

        return button
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupActions()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with product: Product) {
        self.productID = product.id
        nameLabel.text = product.name
        priceLabel.text = "Цена:\n \(product.price) byn"
        statusLabel.text = "Статус:\n \(product.status)"
        addStarsToRatingLabel(evaluation: product.rating)
        descriptionLabel.text = product.shortDescription
        imageView.image = UIImage(systemName: product.image)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        nameLabel.addShadow()
        addSubview(nameLabel)
        imageView.addShadow()
        addSubview(imageView)
        priceLabel.addShadow()
        addSubview(priceLabel)
        addSubview(statusLabel)
        addSubview(ratingTextLabel)
        ratingLabel.addShadow()
        addSubview(ratingLabel)
        addBusket.addShadow()
        addSubview(addBusket)
        favoriteButton.addShadow()
        addSubview(favoriteButton)
        addSubview(discriptionTextLabel)
        discriptionTextLabel.addShadow()
        addSubview(descriptionLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addBusket.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        // imageView layer
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // nameLabel
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            // priceLabel
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            priceLabel.heightAnchor.constraint(equalToConstant: 60),
            // imageView
            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            // ratingPeopleLabel
            ratingTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            ratingTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            ratingTextLabel.widthAnchor.constraint(equalToConstant: 170),
            ratingTextLabel.heightAnchor.constraint(equalToConstant: 25),
            // ratingLabel
            ratingLabel.topAnchor.constraint(equalTo: ratingTextLabel.bottomAnchor, constant: 0),
            ratingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            ratingLabel.widthAnchor.constraint(equalToConstant: 120),
            ratingLabel.heightAnchor.constraint(equalToConstant: 40),
            // addBusket
            addBusket.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            addBusket.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            addBusket.widthAnchor.constraint(equalToConstant: 120),
            addBusket.heightAnchor.constraint(equalToConstant: 30),
            // lookProduct
            favoriteButton.topAnchor.constraint(equalTo: addBusket.bottomAnchor, constant: 2),
            favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            // statusLabel
            statusLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            statusLabel.widthAnchor.constraint(equalToConstant: 250),
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            // discriptionTextLabel
            discriptionTextLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            discriptionTextLabel.heightAnchor.constraint(equalToConstant: 40),
            discriptionTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            discriptionTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: discriptionTextLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    // MARK: - Setup actions
    private func setupActions() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        addBusket.addTarget(self, action: #selector(addToBasketButtonTapped), for: .touchUpInside)
    }
    // add stars from product.rating
    private func addStarsToRatingLabel(evaluation: Int) {
        ratingLabel.subviews.forEach { $0.removeFromSuperview() }
        var previousStarButton: UIButton?
        for number in 1...5 {
            let starButton = UIButton()
            starButton.imageView?.contentMode = .scaleAspectFit
            starButton.setImage(UIImage(systemName: number <= evaluation ? "star.fill" : "star"), for: .normal)

            starButton.tintColor = .black
            starButton.sizeThatFits(CGSize(width: 40, height: 40))
            starButton.translatesAutoresizingMaskIntoConstraints = false
            ratingLabel.addSubview(starButton)
            // Constraint starButton
            NSLayoutConstraint.activate([
                starButton.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
                starButton.widthAnchor.constraint(equalToConstant: 30),
                starButton.heightAnchor.constraint(equalToConstant: 30)
            ])
            if let previousButton = previousStarButton {
                starButton.leadingAnchor.constraint(equalTo:
                                                        previousButton.trailingAnchor, constant: 0).isActive = true
            } else {
                starButton.leadingAnchor.constraint(equalTo:
                                                        ratingLabel.leadingAnchor).isActive = true
            }
            previousStarButton = starButton
        }
    }
    // MARK: - Actions
    @objc private func addToBasketButtonTapped() {
        guard let productID = self.productID else { return }
        delegate?.didAddProductToUserBasket(productID: productID)
    }
    @objc private func favoriteButtonTapped() {
        isFavorite.toggle()
        updateFavoriteButtonState()
    }
    private func updateFavoriteButtonState() {
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
