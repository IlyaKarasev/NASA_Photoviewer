//
//  AppDelegate.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let firstController = PhotoController()
        let navigationController = UINavigationController(rootViewController: firstController)
        self.window?.rootViewController = navigationController
        
        return true
    }
    
}

