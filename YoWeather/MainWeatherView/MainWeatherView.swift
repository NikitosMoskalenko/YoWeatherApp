//
//  MainWeatherView.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/10/20.
//

import UIKit

 // MARK: - MainWeatherViewInput

protocol MainWeatherViewInput: AnyObject {
    func tableViewSetup()
}

 // MARK: - MainWeatherViewOutput

protocol MainWeatherViewOutput: AnyObject { }

 // MARK: - MainWeatherView

final class MainWeatherView: UIView {
    
     // MARK: - Private properties
    
    private var tempLable = UILabel()
    private var placeTitleLable = UILabel()
    private var weatherTableView = UITableView()
    
     // MARK: - Controller
    
    weak var controller: MainWeatherViewOutput!
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func placeTitleLableSetup(title: String) {
        
    }
    
    private func tempLabelSetUP(title: String) {
        tempLable.text = title
        tempLable.font = UIFont(name: "Apple SD Gothic Neo Heavy", size: 24)
        tempLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tempLable)
        tempLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
}

 // MARK: - MainWeatherViewInput

extension MainWeatherView: MainWeatherViewInput {
    
    func tableViewSetup() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    func set() {
    }
}

 // MARK: - UITableViewDelegate, UITableViewDataSource

extension MainWeatherView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
