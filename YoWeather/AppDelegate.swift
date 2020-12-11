//
//  AppDelegate.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        LocationManager.shared.checkLocationServices()
        NetworkServices.shared.checkInthernetConnection()
        creatMainView()
        
        return true
    }
    
    private func creatMainView() {
        let navController = UINavigationController(rootViewController: MainWeatherController())

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }

}

