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
    // MARK: - UI components
    private let profileLabel = BaseLabelView(text: "Личный кабинет", size: 24, weight: .bold)
    private let lineView = BaseLineView()
    private let balanceLabel = BaseLabelView(text: "Мои финансы", size: 14, weight: .bold)
    private let balanceLineView = BaseLineView()
    private let basketLabel = BaseLabelView(text: "Моя корзина", size: 14, weight: .bold)
    private let basketLineView = BaseLineView()
    private let myBalance = TransparentButtonView(title: "Проверить баланс", size: UIScreen.main.bounds.width)
    private let addMoneyToBalance = TransparentButtonView(title: "Пополнить баланс", size: UIScreen.main.bounds.width)
    // MARK: - TableView
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height )
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = .backgroundColor
        // Register a Cell for a Collection
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return table
    }()
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBasketProductData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setupViews()
        setupConstraints()
        //        loadBasketProductData()
        setupActions()
    }
    // MARK: - Setup actions
    private func setupActions() {
        myBalance.addTarget(self, action: #selector(checkMyBalanceTapped), for: .touchUpInside)
        addMoneyToBalance.addTarget(self, action: #selector(addMoneyToBalanceTapped), for: .touchUpInside)
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(profileLabel)
        view.addSubview(lineView)
        view.addSubview(balanceLabel)
        view.addSubview(balanceLineView)
        view.addSubview(basketLabel)
        view.addSubview(basketLineView)
        view.addSubview(myBalance)
        view.addSubview(addMoneyToBalance)
        view.addSubview(tableView)
        myBalance.translatesAutoresizingMaskIntoConstraints = false
        addMoneyToBalance.translatesAutoresizingMaskIntoConstraints = false
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
            balanceLabel.heightAnchor.constraint(equalToConstant: 50),
            // balanceLineView
            balanceLineView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 1),
            balanceLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            balanceLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            balanceLineView.heightAnchor.constraint(equalToConstant: 1),
            // myBalance
            myBalance.topAnchor.constraint(equalTo: balanceLineView.bottomAnchor, constant: 1),
            myBalance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myBalance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myBalance.heightAnchor.constraint(equalToConstant: 50),
            // addMoneyToBalance
            addMoneyToBalance.topAnchor.constraint(equalTo: myBalance.bottomAnchor, constant: 1),
            addMoneyToBalance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            addMoneyToBalance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            addMoneyToBalance.heightAnchor.constraint(equalToConstant: 50),
            // basketLabel
            basketLabel.topAnchor.constraint(equalTo: addMoneyToBalance.bottomAnchor, constant: 1),
            basketLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            basketLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            basketLabel.heightAnchor.constraint(equalToConstant: 50),
            // basketLineView
            basketLineView.topAnchor.constraint(equalTo: basketLabel.bottomAnchor, constant: 1),
            basketLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            basketLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            basketLineView.heightAnchor.constraint(equalToConstant: 1),
            // tableView
            tableView.topAnchor.constraint(equalTo: basketLineView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
    // MARK: - Actions
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
        let productsRequest = requestFactory.makeGetAllBasketProductRequestFatory()
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
    func didRemoveItem(at indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let row = indexPath.row
            if basketProducts.indices.contains(row) {
                let productID = basketProducts[row].product.id
                basketProducts.remove(at: row)
                deleteProduct(iD: productID!)
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
                break
            case .failure(let error):
                print("Failed to change quantity product in user basket: \(error)")
            }
        })
    }
}

// // MARK: - SwiftUI
// import SwiftUI
//
// struct FlowProvider: PreviewProvider {
//    static var previews: some View {
//        ContainterView().edgesIgnoringSafeArea(.all)
//    }
//    struct ContainterView: UIViewControllerRepresentable {
//        let tabBar = ProfileViewController( )
//        func makeUIViewController(context:
//                                  UIViewControllerRepresentableContext<FlowProvider.ContainterView>) -> ProfileViewController {
//            return tabBar
//        }
//        func updateUIViewController(_ uiViewController:
//                                    FlowProvider.ContainterView.UIViewControllerType,context:
//                                    UIViewControllerRepresentableContext<FlowProvider.ContainterView>) {
//        }
//    }
// }
