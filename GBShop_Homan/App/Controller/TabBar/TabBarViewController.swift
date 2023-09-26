//
//  TabBarViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9660630822, green: 0.6466907859, blue: 0.6625785232, alpha: 1)
        generateTabBar()
        setTabBarAppearance()
    }
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: ProfileViewController(), title: "Профиль", image: UIImage(systemName:"person.fill")),
            generateVC(viewController: CatalogViewController(), title: "Каталог", image: UIImage(systemName:"book.fill")),
            generateVC(viewController: SettingViewController(), title: "Настройки", image: UIImage(systemName:"slider.horizontal.3"))
        ]
    }

    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    private func setTabBarAppearance () {
        let positionOnX: CGFloat = 10
    let positionOnY: CGFloat = 14

    let width = tabBar.bounds.width - positionOnX * 2
    let height = tabBar.bounds.height + positionOnY * 2

    let roundLayer = CAShapeLayer()
    let bezierPath = UIBezierPath(
   roundedRect: CGRect(x: positionOnX,
                       y: (tabBar.bounds.minY - positionOnY),
                       width: width,
                       height: height),
   cornerRadius: height / 2 )
        roundLayer.path = bezierPath.cgPath

        tabBar.layer.insertSublayer(roundLayer, at: 0)

        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered

        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
