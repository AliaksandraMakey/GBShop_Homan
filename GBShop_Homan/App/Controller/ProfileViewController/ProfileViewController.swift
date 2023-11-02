//
//  ProfileViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    let requestFactory = RequestFactory()
    var basketProducts = [BasketProduct]()
    var totalPrice: Double = 0.0 {
        didSet {
            totalPriceLabel.text = String(format: "%.2f", totalPrice)
        }
    }
    // MARK: - UI components
    private let profileLabel = BaseLabelView(text: "Личный кабинет", size: 24, weight: .bold)
    private let lineView = BaseLineView()
    private let balanceLabel = BaseLabelView(text: "Мои финансы", size: 14, weight: .bold)
    private let balanceLineView = BaseLineView()
    private let basketLabel = BaseLabelView(text: "Моя корзина", size: 14, weight: .bold)
    private var totalValueProductLabel = BaseLabelView(text: "Стоимость всех товаров:", size: 14, weight: .bold)
    private lazy var totalPriceLabel: BaseLabelView = {
        let totalPrice = "\(totalPrice)"
        return BaseLabelView(text: totalPrice, size: 16, weight: .bold)
    }()
    private let basketLineView = BaseLineView()
    private let myBalanceButton = TransparentButtonView(title: "Проверить баланс", size: UIScreen.main.bounds.width)
    private let addMoneyToBalanceButton = TransparentButtonView(title: "Пополнить баланс", size: UIScreen.main.bounds.width)
    private let createOrderButton = TransparentButtonView(title: "Оформить заказ", size: UIScreen.main.bounds.width)
    // MARK: - TableView
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height )
        table.delegate = self
        table.dataSource = self

        table.backgroundColor = .backgroundColor
        // Register a Cell for a Collection
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 2 * 100, right: 0)
        table.contentInset = contentInset
        return table
    }()
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBasketProductData()
        updateTotalPrice()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstraints()
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        myBalanceButton.addTarget(self, action: #selector(checkMyBalanceTapped), for: .touchUpInside)
        addMoneyToBalanceButton.addTarget(self, action: #selector(addMoneyToBalanceTapped), for: .touchUpInside)
        createOrderButton.addTarget(self, action: #selector(createOrderTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(profileLabel)
        view.addSubview(lineView)
        lineView.addShadow()
        view.addSubview(balanceLabel)
        balanceLabel.addShadow()
        view.addSubview(balanceLineView)
        view.addSubview(basketLabel)
        basketLabel.addShadow()
        view.addSubview(basketLineView)
        basketLineView.addShadow()
        view.addSubview(myBalanceButton)
        view.addSubview(addMoneyToBalanceButton)
        view.addSubview(totalValueProductLabel)
        totalValueProductLabel.addShadow()
        view.addSubview(totalPriceLabel)
        totalPriceLabel.addShadow()
        view.addSubview(createOrderButton)
        view.addSubview(tableView)
        myBalanceButton.translatesAutoresizingMaskIntoConstraints = false
        addMoneyToBalanceButton.translatesAutoresizingMaskIntoConstraints = false
        createOrderButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // profileLabel
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            // lineView
            lineView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 1),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            // balanceLabel
            balanceLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 1),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            balanceLabel.heightAnchor.constraint(equalToConstant: 44),
            // balanceLineView
            balanceLineView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 1),
            balanceLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            balanceLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            balanceLineView.heightAnchor.constraint(equalToConstant: 1),
            // myBalance
            myBalanceButton.topAnchor.constraint(equalTo: balanceLineView.bottomAnchor, constant: 1),
            myBalanceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myBalanceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myBalanceButton.heightAnchor.constraint(equalToConstant: 44),
            // addMoneyToBalance
            addMoneyToBalanceButton.topAnchor.constraint(equalTo: myBalanceButton.bottomAnchor, constant: 1),
            addMoneyToBalanceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            addMoneyToBalanceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            addMoneyToBalanceButton.heightAnchor.constraint(equalToConstant: 44),
            // createOrderButton
            createOrderButton.topAnchor.constraint(equalTo: addMoneyToBalanceButton.bottomAnchor, constant: 1),
            createOrderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            createOrderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            createOrderButton.heightAnchor.constraint(equalToConstant: 44),
            // basketLabel
            basketLabel.topAnchor.constraint(equalTo: createOrderButton.bottomAnchor, constant: 1),
            basketLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            basketLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            basketLabel.heightAnchor.constraint(equalToConstant: 50),
            // basketLineView
            basketLineView.topAnchor.constraint(equalTo: basketLabel.bottomAnchor, constant: 0),
            basketLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            basketLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            basketLineView.heightAnchor.constraint(equalToConstant: 1),
            // totalValueProductLabel
            totalValueProductLabel.topAnchor.constraint(equalTo: basketLineView.bottomAnchor, constant: 4),
            totalValueProductLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            totalValueProductLabel.heightAnchor.constraint(equalToConstant: 40),
            // totalPriceLabel
            totalPriceLabel.topAnchor.constraint(equalTo: basketLineView.bottomAnchor, constant: 4),
            totalPriceLabel.leadingAnchor.constraint(equalTo: totalValueProductLabel.trailingAnchor, constant: 6),
            totalPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 40),
            // tableView
            tableView.topAnchor.constraint(equalTo: totalValueProductLabel.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
    // MARK: - Actions
    @objc private func createOrderTapped() {
        let alert = Alerts()
        let createOrder = requestFactory.makeCreateOrderFromUsersBasket()
        createOrder.createOrder { result in
            switch result {
            case .success:
                alert.showSuccessShoppingAlert(presenter: self)
            case .failure:
                alert.showDontHaveManeyInCashAccountAlert(presenter: self)
            }
        }
    }
    func updateTotalPrice() {
        let totalPriceRequest = requestFactory.makeGetTotalPrice()
        totalPriceRequest.getTotalPrice { result in
            switch result {
            case .success(let total):
                self.totalPrice = total
                self.updateUI()
            case .failure(let error):
                print("Failed to load total price: \(error)")
            }
        }
    }
    @objc private  func checkMyBalanceTapped() {
        let alertBalanceViewController = AlertBalanceViewController()
        alertBalanceViewController.modalPresentationStyle = .formSheet
        self.present(alertBalanceViewController, animated: true, completion: nil)
    }
    @objc private  func addMoneyToBalanceTapped() {
        let alertAddMoneyViewController = AlertAddMoneyInBalanceViewController()
        alertAddMoneyViewController.modalPresentationStyle = .formSheet
        self.present(alertAddMoneyViewController, animated: true, completion: nil)
    }
    private func loadBasketProductData() {
        let productsRequest = requestFactory.makeGetAllBasketProduct()
        productsRequest.getAllBasketProducts { result in
            switch result {
            case .success(let products):
                self.basketProducts = products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to load basket product data: \(error)")
            }
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProfileViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketProducts.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            didRemoveItem(at: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let product = basketProducts[indexPath.row]
        cell.delegate = self
        cell.indexPath = indexPath
        cell.configure(with: product)
        return cell
    }
}
// MARK: - CustomTableCellDelegate
extension ProfileViewController: CustomTableCellDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            self.totalPriceLabel.text = String(format: "%.2f", self.totalPrice)
        }
    }

    func didRemoveItem(at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let row = indexPath.row
            if basketProducts.indices.contains(row) {
                let productID = basketProducts[row].product.id
                basketProducts.remove(at: row)
                deleteProduct(iD: productID!)
                updateTotalPrice()
            }
        }
    }
    func didIncrementQuantity(at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let row = indexPath.row
            if basketProducts.indices.contains(row) {
                basketProducts[row].quantity += 1
                tableView.reloadRows(at: [indexPath], with: .none)
                changeQuantity((basketProducts[row].quantity + 1), iD: basketProducts[row].product.id!)
            }
        }
    }
    func didDecrementQuantity(at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let row = indexPath.row
            if basketProducts.indices.contains(row) {
                if basketProducts[row].quantity > 1 {
                    basketProducts[row].quantity -= 1
                    tableView.reloadRows(at: [indexPath], with: .none)
                    changeQuantity((basketProducts[row].quantity - 1), iD: basketProducts[row].product.id!)
                }
            }
        }
    }
    func didUpdateQuantity(_ quantity: Int, at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let row = indexPath.row
            if basketProducts.indices.contains(row) {
                basketProducts[row].quantity = quantity
                tableView.reloadRows(at: [indexPath], with: .none)
                changeQuantity(quantity, iD: basketProducts[row].product.id!)
            }
        }
    }
    func deleteProduct(iD idProduct: UUID) {
        let deleteProductFromBasket = requestFactory.makeDeleteProductFromBasket()
        deleteProductFromBasket
            .deleteProductFromBasketByID(idProduct: idProduct) { [weak self] response in
                guard self != nil else { return }
                switch response {
                case .success:
                    self?.updateTotalPrice()
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Failed to delete product from user basket: \(error)")
                }
            }
    }
    func changeQuantity(_ quantity: Int, iD idProduct: UUID) {
        let changeQuantityRequest = requestFactory.makeChangeQuantityProduct()
        changeQuantityRequest.changeQuantityProduct(idProduct: idProduct,
                                                    quantity: quantity,
                                                    completionHandler: {  [weak self] response in
            guard self != nil else { return }
            switch response {
            case .success:
                self?.updateTotalPrice()
            case .failure(let error):
                print("Failed to change quantity product in user basket: \(error)")
            }
        })
    }
}
