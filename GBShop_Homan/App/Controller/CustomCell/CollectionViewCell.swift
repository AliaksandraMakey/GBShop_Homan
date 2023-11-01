//
//  HorisontalCatalogCell.swift
//  GBShop_Homan
//
//  Created by aaa on 26/09/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let reuseIdentifier = "CollectionViewCell"
    weak var delegate: ProductViewDelegate?
    var indexPath: IndexPath?
    // MARK: - UI components
    private let productView = ProductView()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with product: Product) {
        productView.configure(with: product)
        productView.delegate = self.delegate
    }
    // MARK: - Setup subviews
    private func setupViews() {
        contentView.addSubview(productView)
        productView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
             productView.topAnchor.constraint(equalTo: contentView.topAnchor),
             productView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             productView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             productView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
         ])
    }
}
