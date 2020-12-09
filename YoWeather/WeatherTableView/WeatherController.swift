//
//  WeatherController.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

 // MARK: - WeatherController

class WeatherController: UIViewController {
    
     // MARK: - model
    
    var model: WeatherModelProtocol = WeatherModel()
    
     // MARK: - weatherView
    
    private var weatherView: WeatherViewInput! {
        self.view as? WeatherViewInput
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        let view: WeatherView = WeatherView.fromNib()
        view.controller = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherView.tableViewSetUp()
        weatherView.searchBarSetup()
    }
    
}

 // MARK: - WeatherViewOutput

extension WeatherController: WeatherViewOutput {
    
}
