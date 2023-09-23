//
//  EntranceViewController.swift
//  GBShop_Homan
//
//  Created by aaa on 18/09/2023.
//

import UIKit

final class EntranceViewController: UIViewController {
    var window: UIWindow?
    init(window: UIWindow?) {
        super.init(nibName: nil, bundle: nil)
        self.window = window
    }
    lazy var startViewController = LoginViewController()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addStartViewController()
    }
    private func addStartViewController() {
        self.addChild(self.startViewController)
        self.view.addSubview(self.startViewController.view)
        self.startViewController.didMove(toParent: self)
        self.startViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.startViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.startViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.startViewController.view.heightAnchor.constraint(equalToConstant: 500.0),
            self.startViewController.view.widthAnchor.constraint(equalToConstant: 350.0)
        ])
    }
    func start() {
        let rootVC = LoginViewController()
//        rootVC.navigationItem.title = ""
//        let navVC = self.configuredNavigationController
//        navVC.viewControllers = [rootVC]
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
}
