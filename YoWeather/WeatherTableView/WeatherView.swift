//
//  WeatherTable.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

 // MARK: - WeatherViewInput

protocol WeatherViewInput: AnyObject {
    
    func tableViewSetUp()
    func searchBarSetup()
}

 // MARK: - WeatherViewOutput

protocol WeatherViewOutput: AnyObject {
}

 // MARK: - WeatherView

class WeatherView: UIView {
    
    // MARK: -  @IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var weatherTable: UITableView!
    
    
     // MARK: - Controller
    
    weak var controller: WeatherViewOutput!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension WeatherView: WeatherViewInput {
    
    func tableViewSetUp() {
        let cellNib = UINib(nibName: "CityCell", bundle: nil)
        weatherTable.register(cellNib, forCellReuseIdentifier: "CityCell")
        weatherTable.delegate = self
        weatherTable.dataSource = self
    }
    
    func searchBarSetup() {
        searchBar.delegate = self
    }
    
}

 // MARK: - UITableViewDelegate, UITableViewDataSource

extension WeatherView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell else { return UITableViewCell() }
        cell.backgroundColor = .white
        return cell
    }
}

extension WeatherView: UISearchBarDelegate {
    
}
