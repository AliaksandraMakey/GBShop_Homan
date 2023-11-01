//
//  TabBarViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .backgroundColor
        generateTabBar()
        setTabBarAppearance()
        NotificationCenter.default.addObserver(self, selector: #selector(switchToThirdTab), name: Notification.Name("SwitchToThirdTab"), object: nil)
    }
    // FIXME: - вынести все строковые литералы в отдельный enum
    private func generateTabBar() {
        viewControllers = [
            generateNavigationController(rootViewController: CatalogViewController(), title: "Каталог", image: UIImage(systemName:"book")),
            generateNavigationController(rootViewController: FavoriteViewController(), title: "Избранное", image: UIImage(systemName:"heart.text.square")),
            generateNavigationController(rootViewController: ProfileViewController(), title: "Личный кабинет", image: UIImage(systemName:"person")),
            generateNavigationController(rootViewController: SettingViewController(), title: "Настройки", image: UIImage(systemName:"slider.horizontal.3"))
        ]
    }
    /// generate navigation
    /// - Parameters:
    ///   - rootViewController: UIViewController which we use for TabBar
    ///   - title: String
    ///   - image: UIImage?
    /// - Returns: UIViewController
    private func generateNavigationController(rootViewController: UIViewController,
                                              title: String,
                                              image: UIImage?) ->
    UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    /// create custom appearance TabBar
    private func setTabBarAppearance () {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 8
        
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
        tabBar.itemWidth = width / 6
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .backgroundButtonColor
    }
    // MARK: - Actions
    @objc private func switchToThirdTab() {
        self.selectedIndex = 2
    }
}

// MARK: - SwiftUI
// import SwiftUI
//
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
