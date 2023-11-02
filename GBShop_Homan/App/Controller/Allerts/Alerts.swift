//
//  Alerts.swift
//  GBShop_Homan
//
//  Created by Александра Макей on 01.11.2023.
//

import UIKit

class Alerts {
    /**
     Displays a custom alert with the provided title, message, and actions on the given view controller.

     - Parameters:
        - title: The title of the alert.
        - message: The message displayed in the alert.
        - actions: An array of UIAlertAction objects to be added to the alert.
        - presenter: The view controller on which the alert will be presented.
     */
    static func showAlert(title: String, message: String, actions: [UIAlertAction], presenter: UIViewController) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            for action in actions {
                alertController.addAction(action)
            }
            
            presenter.present(alertController, animated: true, completion: nil)
        }
    }
    /**
     Displays a success alert with options to continue shopping or go to the shopping cart.
     
     - Parameters:
        - presenter: The view controller on which the alert will be presented.
     */
    func showSuccessAlert(presenter: UIViewController) {
        let continueShoppingAction = UIAlertAction(title: "Continue Shopping", style: .default) { _ in
            presenter.dismiss(animated: true, completion: nil)
        }
        
        let goToBasketAction = UIAlertAction(title: "Go to Cart", style: .default) { _ in
            NotificationCenter.default.post(name: Notification.Name("SwitchToThirdTab"), object: nil)
        }
        
        let actions = [continueShoppingAction, goToBasketAction]
        
        Alerts.showAlert(
            title: "Item added\nQuantity: 1\nYou can adjust the quantity in the cart.",
            message: "Do you want to change the quantity?",
            actions: actions,
            presenter: presenter
        )
    }
    /**
     Displays an alert informing the user that an email is already registered and provides an option to proceed.

     - Parameters:
        - presenter: The view controller on which the alert will be presented.
     */
    func showEmailAlreadyExistsAlert(presenter: UIViewController) {
        let okAction = UIAlertAction(title: "Understood", style: .default) { _ in
            let loginViewController = LoginViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            presenter.present(loginViewController, animated: true, completion: nil)
        }
        
        let actions = [okAction]
        
        Alerts.showAlert(
            title: "Warning",
            message: "A user with this email is already registered.",
            actions: actions,
            presenter: presenter
        )
    }
    /**
     Shows an alert for successful user registration, indicating that a confirmation email will be sent.

     - Parameters:
        - presenter: The view controller on which the alert will be presented.
     */
    func showSuccessRegistrationAlert(presenter: UIViewController) {
        let okAction = UIAlertAction(title: "Understood", style: .default) { _ in
            let loginViewController = LoginViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            presenter.present(loginViewController, animated: true, completion: nil)
        }
        
        let actions = [okAction]
        
        Alerts.showAlert(
            title: "Successful Registration",
            message: "A confirmation email should arrive at your email address.",
            actions: actions,
            presenter: presenter
        )
    }
    /**
     Displays an alert to inform the user of a successful logout and provides an option to log in again.

     - Parameters:
        - presenter: The view controller on which the alert will be presented.
     */
    func showSuccessLogoutAlert(presenter: UIViewController) {
        let okAction = UIAlertAction(title: "Log In Again", style: .default) { _ in
            let loginViewController = LoginViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            presenter.present(loginViewController, animated: true, completion: nil)
        }
        
        let actions = [okAction]
        
        Alerts.showAlert(
            title: "Logout Successful",
            message: "",
            actions: actions,
            presenter: presenter
        )
    }
    /**
     Presents an alert for successful profile data update and offers an option to continue.

     - Parameters:
        - presenter: The view controller on which the alert will be presented.
     */
    func showSuccessUpdateProfileAlert(presenter: UIViewController) {
        let okAction = UIAlertAction(title: "Understood", style: .default) { _ in
            let tabBarViewController = TabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            presenter.present(tabBarViewController, animated: true, completion: nil)
        }
        
        let actions = [okAction]
        
        Alerts.showAlert(
            title: "Data Successfully Updated",
            message: "",
            actions: actions,
            presenter: presenter
        )
    }
}
