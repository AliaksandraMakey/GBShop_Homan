//
//  ProfileCustomTableCellDelegate.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 31.10.2023.
//

import Foundation

/// The `CustomTableCellDelegate` protocol defines a set of methods that a delegate can implement to respond to quantity increment, decrement, and update events within a custom table cell.
protocol CustomTableCellDelegate: AnyObject {
    /// Informs the delegate that the quantity for an item at the specified `indexPath` has been incremented.
    ///
    /// - Parameter indexPath: The index path of the item whose quantity was incremented.
    func didIncrementQuantity(at indexPath: IndexPath?)
    /// Informs the delegate that the quantity for an item at the specified `indexPath` has been decremented.
    ///
    /// - Parameter indexPath: The index path of the item whose quantity was decremented.
    func didDecrementQuantity(at indexPath: IndexPath?)
    /// Informs the delegate that the quantity for an item at the specified `indexPath` has been updated to the given `quantity`.
    ///
    /// - Parameters:
    ///   - quantity: The new quantity for the item.
    ///   - indexPath: The index path of the item with the updated quantity.
    func didUpdateQuantity(_ quantity: Int, at indexPath: IndexPath?)
    /// Informs the delegate that the quantity for an item at the specified `indexPath` has been deleted.
    ///
    /// - Parameter indexPath: The index path of the item whose quantity was decremented.
    func didRemoveItem(at indexPath: IndexPath?)
}
