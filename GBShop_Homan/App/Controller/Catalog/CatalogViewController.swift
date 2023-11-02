//
//  CatalogViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class CatalogViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    private var products: [Product] = []
    // MARK: - UI components
    private let catalogLabel = BaseLabelView(text: "Каталог", size: 24, weight: .bold)
    private let cartLabel = BaseLabelView(text: "В вашей корзине\n0 товаров")
    private let checkBasketButton = BaseButtonView(title: "Посмотреть корзину", size: 14)
    private let lineFirstView = BaseLineView()
    private let lineSecondView = BaseLineView()
    // MARK: - collectionView
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height/1.8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .backgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
        // Register a Cell for a Collection
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstraints()
        loadCatalogData()
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        checkBasketButton.addTarget(self, action: #selector(checkBasketTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(catalogLabel)
        view.addSubview(lineFirstView)
        lineFirstView.addShadow()
        view.addSubview(collectionView)
        view.addSubview(lineSecondView)
        lineSecondView.addShadow()
        cartLabel.addShadow()
        view.addSubview(cartLabel)
        checkBasketButton.addShadow()
        view.addSubview(checkBasketButton)
        catalogLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        checkBasketButton.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // catalogLabel
            catalogLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            catalogLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            catalogLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            // lineView
            lineFirstView.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 1),
            lineFirstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            lineFirstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            lineFirstView.heightAnchor.constraint(equalToConstant: 1),
            // collectionView
            collectionView.topAnchor.constraint(equalTo: lineFirstView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/1.8),
            // lineView
            lineSecondView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            lineSecondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            lineSecondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            lineSecondView.heightAnchor.constraint(equalToConstant: 1),
            // cartLabel
            cartLabel.topAnchor.constraint(equalTo: lineSecondView.bottomAnchor, constant: 10),
            cartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cartLabel.heightAnchor.constraint(equalToConstant: 60),
            // cartButton
            checkBasketButton.topAnchor.constraint(equalTo: lineSecondView.bottomAnchor, constant: 20),
            checkBasketButton.widthAnchor.constraint(equalToConstant: 170),
            checkBasketButton.heightAnchor.constraint(equalToConstant: 30),
            checkBasketButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    // MARK: - Actions
    @objc private func checkBasketTapped() {
        NotificationCenter.default.post(name: Notification.Name("SwitchToThirdTab"), object: nil)
    }
    private func loadCatalogData() {
        let productsRequest = requestFactory.makeCatalogDataRequest()
        productsRequest.getCatalogData {  result in
            switch result {
            case .success(let products):
                self.products = products
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to load catalog data: \(error)")
            }
        }
    }
}
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.item]
        cell.delegate = self
        cell.indexPath = indexPath
        cell.configure(with: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = ProductViewController()
        let product = products[indexPath.item]
        nextViewController.product = product

        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
// MARK: - ProductViewDelegate
extension CatalogViewController: ProductViewDelegate {
    func didAddProductToUserBasket(productID: UUID) {
        addProduct(iD: productID)
    }
    func addProduct(iD idProduct: UUID) {
        let addProductRequest = requestFactory.makeAddProductToBasket()
        let quantity = 1
        addProductRequest.addProductToBasket(idProduct: idProduct, quantity: quantity) {   [weak self] response in
            guard self != nil else { return }
            switch response {
            case .success:
                self?.showSuccessAlert()
            case .failure(let error):
                print("Failed to add product to basket data: \(error)")
            }
        }
    }
    // MARK: - Allerts
    private func showSuccessAlert() {
        let alert = Alerts()
        alert.showSuccessAlert(presenter: self)
    }
}
