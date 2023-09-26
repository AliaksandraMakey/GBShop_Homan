//
//  AppDelegate.swift
//  GBShop_Homan
//
//  Created by aaa on 17/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    private func authRequest() {
        let auth = requestFactory.makeAuthRequest()
        auth.login(login: "Aliaksandra.makey@gmail.com",
                   password: "geekbrains") { response in
            switch response.result {
            case .success(let login):
                LocalStorageManager.shared.setRefreshToken(login.refreshToken)
                LocalStorageManager.shared.setAccessToken(login.accessToken)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func changesUserDataRequest() {
        let profile = requestFactory.makeChangesProfileRequest()
        profile.changesProfile(fullName: "Tom",
                               gender: "male",
                               isAdmin: true) { response in
            if response.response != nil {
                switch response.response!.statusCode {
                case 200:
                    print(response.response!.statusCode)
                case let statusCode:
                    print("данные не сохранены, статус ошибки - -\(statusCode)")
                }
            }
        }
    }

    private func logoutRequest() {
        let logout = requestFactory.makeLogoutRequest()
        logout.logout { response in
            switch response.response?.statusCode {
            case 200:
                print(LocalStorageManager.shared.getRefreshTokenString())
                LocalStorageManager.shared.clearPairOfTokens()
            case let statusCode?:
                print("разлогирование не удалось, статус ошибки -\(statusCode)")
            default:
                print("разлогирование не удалось")
            }
        }
    }
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
