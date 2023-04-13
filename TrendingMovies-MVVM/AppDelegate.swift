//
//  AppDelegate.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-13.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

