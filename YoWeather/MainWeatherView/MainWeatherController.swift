//
//  MainWeatherController.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/10/20.
//

import UIKit

// MARK: - MainWeatherController

final class MainWeatherController<View: MainWeatherView>: UIViewController {
    
    
    // MARK: - model
    
    private var model: WeatherModelProtocol = WeatherModel()
    
    // MARK: - mainWeatherView
    
    private var mainWeatherView: MainWeatherViewInput! {
        self.view as? View
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        getWeatherData()
        //        mainWeatherView.tableViewSetup()
    }
    
    private func getWeatherData() {
        
        let locationManager = LocationManager.shared
        RequestManager.getWeather(lat: locationManager.location.coordinate.latitude,
                                  lon: locationManager.location.coordinate.longitude) { (mainModel) in
            self.model.mainModel = mainModel
        }
    }
    
}

// MARK: - MainWeatherViewOutput

extension MainWeatherController: MainWeatherViewOutput {
    
}
