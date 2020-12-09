//
//  DetailWeatherController.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

 // MARK: - DetailWeatherController

class DetailWeatherController: UIViewController {
    
     // MARK: - Model
    
    var model: DetailWeatherModelProtocol = DetailWeatherModel()
    
     // MARK: - View
    
    private var detailWeatherView: DetailWeatherViewInput! {
        self.view as? DetailWeatherViewInput
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        let view: DetailWeatherView = DetailWeatherView.fromNib()
        view.controller = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailWeatherView.set()
    }
    
}

 // MARK: - DetailWeatherViewOutPut

extension DetailWeatherController: DetailWeatherViewOutPut { }

