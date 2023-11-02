//
//  CustomCollectionCellDelegate.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 31.10.2023.
//

import Foundation

/// A protocol for communicating user actions on a product view to a delegate.
protocol ProductViewDelegate: AnyObject {

    /// Informs the delegate that a product has been added to the user's basket.
    ///
    /// - Parameter productID: The unique identifier of the product added to the basket.
    func didAddProductToUserBasket(productID: UUID)
}
