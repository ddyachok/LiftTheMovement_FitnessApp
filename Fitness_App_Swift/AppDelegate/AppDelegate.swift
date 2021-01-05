//
//  AppDelegate.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 08.10.2020.
//

import UIKit
import Firebase
import CoreData

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

    
    // MARK: - Core Data Stack -

    lazy var persistentContainer: NSPersistentContainer = {
        // name should be the same as name of the created file
        let container = NSPersistentContainer(name: "Coaches")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        return container
    }()

    


}

