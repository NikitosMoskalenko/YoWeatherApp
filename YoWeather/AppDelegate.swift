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
        
//        creatMainView()
        testWindow()
        
        return true
    }
    
    private func testWindow() {
        let navigationController = UINavigationController(rootViewController: DetailWeatherController())
        
        NetworkServices.shared.checkInthernetConnection()
        LocationManager.shared.checkLocationServices()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }
    
    private func creatMainView() {
        let navController = UINavigationController(rootViewController: WeatherController())
        
        NetworkServices.shared.checkInthernetConnection()
        LocationManager.shared.checkLocationServices()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }

}

