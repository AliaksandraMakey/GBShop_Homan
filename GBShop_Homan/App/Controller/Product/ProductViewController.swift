//
//  ProductViewController.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 15.10.2023.
//

import UIKit

class ProductViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    var product: Product?
    // MARK: - UI components
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width * 2, height: 500)
        return scrollView
    }()
    private lazy var contentView: UIView = {
        let someView = UIView()
        return someView
    }()
    private let productView = ProductView()
    private let descriptionTextLabel = BaseLabelView(text: "О продукте", size: 16, weight: .bold)
    private let productDescription = ExpandableLabel()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        setupViews()
        setupConstraints()
        setData()
    }
    // MARK: - Setup ScrollView
    private func setupScrollView() {
        view.backgroundColor = .backgroundColor
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // constraints
        NSLayoutConstraint.activate([
            // scrollView
            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo:
                                                    scrollView.heightAnchor, multiplier: 1)
        ])
    }
    // MARK: - Setup subviews
    private func setupViews() {
        contentView.addSubview(productView)
        contentView.addSubview(descriptionTextLabel)
        contentView.addSubview(productDescription)
        productView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // productView
            productView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            productView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            productView.widthAnchor.constraint(equalToConstant: 200),
            productView.heightAnchor.constraint(equalToConstant: 560),
            // descriptionTextLabel
            descriptionTextLabel.topAnchor.constraint(equalTo: productView.bottomAnchor, constant: 0),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            // productDescription
            productDescription.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 4),
            productDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    private func setData() {
        if let product = product {
            productDescription.text = product.description
            productView.delegate = self
            productView.configure(with: product)
        } else {
            let error = NSError(domain: "product nil", code: 404, userInfo: [NSLocalizedDescriptionKey: "Didn't set product values"])
            print(error.localizedDescription.localizedCapitalized)
        }
    }
}
// MARK: - ProductViewDelegate
extension ProductViewController: ProductViewDelegate {
    func didAddProductToUserBasket(productID: UUID) {
        addProductToBasketRequest(iD: productID)
    }
    func addProductToBasketRequest(iD idProduct: UUID) {
        let addProductRequest = requestFactory.makeAddProductToBasket()
        let quantity = 1
        addProductRequest.addProductToBasket(idProduct: idProduct, quantity: quantity) {   [weak self] response in
            guard self != nil else { return }
            switch response {
            case .success:
                self?.showSuccessAlert()
            case .failure(let error):
                print("Failed to add product to basket: \(error)")
            }
        }
    }
    // MARK: - Allerts
    private func showSuccessAlert() {
        let alert = Alerts()
        alert.showSuccessAlert(presenter: self)
    }
}
