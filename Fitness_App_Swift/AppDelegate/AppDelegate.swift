//
//  AppDelegate.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 08.10.2020.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: SideMenuContainerViewController())
//        window?.rootViewController = SideMenuContainerViewController()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}

