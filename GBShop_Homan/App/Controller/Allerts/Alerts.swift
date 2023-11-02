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
        let continueShoppingAction = UIAlertAction(title: "Продолжить шопинг", style: .default) { _ in
            presenter.dismiss(animated: true, completion: nil)
        }

        let goToBasketAction = UIAlertAction(title: "Перейти к корзине", style: .default) { _ in
            NotificationCenter.default.post(name: Notification.Name("SwitchToThirdTab"), object: nil)
        }

        let actions = [continueShoppingAction, goToBasketAction]

        Alerts.showAlert(
            title: "Товар добавлен\nв количестве:1\nУвеличить количество товара\nвы можеье в корзине",
            message: "Хотите изменить количество?",
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
        let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
            let login = LoginViewController()
            login.modalPresentationStyle = .fullScreen
            presenter.present(login, animated: true, completion: nil)
        }

        let actions = [okAction]

        Alerts.showAlert(
            title: "Предупреждение!",
            message: "На ваш email уже зарегистрирован аккаунт",
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
        let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
            let login = LoginViewController()
            login.modalPresentationStyle = .fullScreen
            presenter.present(login, animated: true, completion: nil)
        }

        let actions = [okAction]

        Alerts.showAlert(
            title: "Регистрация прошла успешно!",
            message: "На вашу почту пройдет сообщение. Перейдите по ссылке в сообщении чтобы завершить регистрацию",
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
        let okAction = UIAlertAction(title: "Войти снова", style: .default) { _ in
            let login = LoginViewController()
            login.modalPresentationStyle = .fullScreen
            presenter.present(login, animated: true, completion: nil)
        }

        let actions = [okAction]

        Alerts.showAlert(
            title: "Вы вышли из аккаунта",
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
        let okAction = UIAlertAction(title: "Понятно", style: .default) { _ in
            let tabBar = TabBarViewController()
            tabBar.modalPresentationStyle = .fullScreen
            presenter.present(tabBar, animated: true, completion: nil)
        }

        let actions = [okAction]

        Alerts.showAlert(
            title: "Данные успешно обновлены",
            message: "",
            actions: actions,
            presenter: presenter
        )
    }

    func showDontHaveManeyInCashAccountAlert(presenter: UIViewController) {
        let continueShoppingAction = UIAlertAction(title: "Вернуться к корзине", style: .default) { _ in
            presenter.dismiss(animated: true, completion: nil)
        }

        let goToBasketAction = UIAlertAction(title: "Пополнить счет?", style: .default) { _ in
            let addMoneyToBalanceAlert = AlertAddMoneyInBalanceViewController()
            addMoneyToBalanceAlert.modalPresentationStyle = .formSheet
            presenter.present(addMoneyToBalanceAlert, animated: true, completion: nil)
        }

        let actions = [continueShoppingAction, goToBasketAction]

        Alerts.showAlert(
            title: "На вашем счету недостаточно средств",
            message: "",
            actions: actions,
            presenter: presenter
        )
    }
    func showSuccessShoppingAlert(presenter: UIViewController) {
        let okAction = UIAlertAction(title: "Продолжить покупки", style: .default) { _ in
            let catalog = TabBarViewController()
            catalog.modalPresentationStyle = .fullScreen
            presenter.present(catalog, animated: true, completion: nil)
        }

        let actions = [okAction]

        Alerts.showAlert(
            title: "Оплата произведена успешно.",
            message: "В течении 10 минут с вами свяжется служба доставки для обсуждения деталей.",
            actions: actions,
            presenter: presenter
        )
    }
}
