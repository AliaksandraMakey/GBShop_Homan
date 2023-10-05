//
//  CatalogViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class CatalogViewController: UIViewController {
    let products: [ProductResult] = [
        ProductResult(name: "Product 1", image: "star", price: 100, status: "In Stock", evaluation: 4, description: "Description 1"),
        ProductResult(name: "Product 2", image: "person", price: 150, status: "Out of Stock", evaluation: 3, description: "Description 2"),
        ProductResult(name: "Product 3", image: "house", price: 75, status: "In Stock", evaluation: 5, description: "Description 3"),
        ProductResult(name: "Product 1", image: "star", price: 100, status: "In Stock", evaluation: 4, description: "Description 1"),
        ProductResult(name: "Product 2", image: "person", price: 150, status: "Out of Stock", evaluation: 3, description: "Description 2"),
        ProductResult(name: "Product 3", image: "house", price: 75, status: "In Stock", evaluation: 5, description: "Description 3")
    ]
    let recomendetLabel: UILabel = {
        let viewedLabel = UILabel()
        viewedLabel.text = "Рекомендации"
        viewedLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return viewedLabel
    }()
    let catalogLabel: UILabel = {
        let viewedLabel = UILabel()
        viewedLabel.text = "Каталог"
        viewedLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return viewedLabel
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstarints()
    }
    func setupView() {
        view.addSubview(recomendetLabel)
        view.addSubview(collectionView)
        view.addSubview(catalogLabel)
        view.addSubview(tableView)
    }
    func setupConstarints() {
        recomendetLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recomendetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            recomendetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            recomendetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            collectionView.topAnchor.constraint(equalTo: recomendetLabel.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            catalogLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            catalogLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            catalogLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),

            tableView.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16)
        ])
    }
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let product = products[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}
extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
}

// MARK: - SwiftUI
// import SwiftUI
// struct FlowProvider: PreviewProvider {
//    static var previews: some View {
//        ContainterView().edgesIgnoringSafeArea(.all)
//    }
//    struct ContainterView: UIViewControllerRepresentable {
//        let tabBar = TabBarViewController( )
//        func makeUIViewController(context:
//                                  UIViewControllerRepresentableContext<FlowProvider.ContainterView>) -> TabBarViewController {
//            return tabBar
//        }
//        func updateUIViewController(_ uiViewController:
//                                    FlowProvider.ContainterView.UIViewControllerType,context:
//                                    UIViewControllerRepresentableContext<FlowProvider.ContainterView>) {
//        }
//    }
// }
// class CatalogViewController: UIViewController {
//
//    let headerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Каталог"
//        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        return label
//    }()
//
//    let horizontalScrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.showsHorizontalScrollIndicator = false
//        return scrollView
//    }()
//
//    let horizontalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 16
//        return stackView
//    }()
//    let recommendationsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Рекомендации"
//        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        return label
//    }()
//    let verticalScrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.showsVerticalScrollIndicator = false
//        return scrollView
//    }()
//    let verticalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 16
//        return stackView
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 0.9660630822, green: 0.6466907859, blue: 0.6625785232, alpha: 1)
//
//        // Добавляем компоненты на экран
//        view.addSubview(headerLabel)
//        view.addSubview(horizontalScrollView)
//        horizontalScrollView.addSubview(horizontalStackView)
//        view.addSubview(recommendationsLabel)
//        view.addSubview(verticalScrollView)
//        verticalScrollView.addSubview(verticalStackView)
//
//        // Устанавливаем constraints
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
//        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
//        recommendationsLabel.translatesAutoresizingMaskIntoConstraints = false
//        verticalScrollView.translatesAutoresizingMaskIntoConstraints = false
//        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//
//            horizontalScrollView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
//            horizontalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            horizontalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            horizontalScrollView.heightAnchor.constraint(equalToConstant: 100),
//
//            horizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
//            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor, constant: 16),
//            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor, constant: -16),
//            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
//
//            recommendationsLabel.topAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor, constant: 16),
//            recommendationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//
//            verticalScrollView.topAnchor.constraint(equalTo: recommendationsLabel.bottomAnchor, constant: 16),
//            verticalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            verticalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            verticalScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            verticalStackView.topAnchor.constraint(equalTo: verticalScrollView.topAnchor),
//            verticalStackView.leadingAnchor.constraint(equalTo: verticalScrollView.leadingAnchor, constant: 16),
//            verticalStackView.trailingAnchor.constraint(equalTo: verticalScrollView.trailingAnchor, constant: -16),
//            verticalStackView.bottomAnchor.constraint(equalTo: verticalScrollView.bottomAnchor),
//            verticalStackView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor, constant: -32) // Устанавливаем ширину равной ширине вертикального скролла с отступами
//        ])
//
//        // Пример создания и добавления переиспользуемой ячейки в вертикальный StackView
//        for _ in 1...10 {
//            let cell = HorisontalCatalogCell()
//            verticalStackView.addArrangedSubview(cell)
//        }
//
//        // Пример создания и добавления переиспользуемой ячейки в горизонтальный StackView
//        for _ in 1...5 {
//            let cell = HorisontalCatalogCell()
//            horizontalStackView.addArrangedSubview(cell)
//        }
//    }
// }
