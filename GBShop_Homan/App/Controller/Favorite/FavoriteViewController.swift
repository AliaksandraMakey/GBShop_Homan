//
//  FavoriteViewController.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 10.10.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    // MARK: - UI components
    private let catalogLabel = BaseLabelView(text: "Избранное", size: 24, weight: .bold)
    private let lineView = BaseLineView()
    // MARK: - collectionView
    private lazy var collectionView: UICollectionView = {
        // layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/1.1, height: UIScreen.main.bounds.height/1.7)
        // collectionView
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
    }
    // MARK: - Setup subviews
    private func setupViews() {
        view.addSubview(catalogLabel)
        view.addSubview(lineView)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // catalogLabel
            catalogLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            catalogLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            catalogLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            // lineView
            lineView.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 1),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            // collectionView
            collectionView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
//        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
//        let product = products[indexPath.item]
//        cell.configure(with: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = ProductViewController()
//        let product = products[indexPath.item]
//        nextViewController.product = product

        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
