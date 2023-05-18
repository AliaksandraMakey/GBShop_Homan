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
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        authRequest()
        return true
    }
    
    private func logoutRequest() {
        let logout = requestFactory.makeLogoutRequestFatory()
        logout.logout(idUser: 1) {
            response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func authRequest() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Aliaks", password: "passwordHoman") {
            response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func changesUserDataRequest() {
        let profile = requestFactory.makeChangesProfileRequestFatory()
        profile.changesProfile(idUser: 1,
                               userName: "AliaksHoman",
                               password: "aliaks",
                               email: "Aliaksandra.makey@gmail.com",
                               gender: "f",
                               creditCard: "1234-4567-1234-4567",
                               bio: "Some text") { response in
            
            switch response.result {
            case .success(let profile):
                print(profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //        // Override point for customization after application launch.
    //        return true
    //    }
    
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

