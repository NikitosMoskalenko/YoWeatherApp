//
//  DetailWeatherView.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import UIKit

// MARK: - DetailWeatherViewInput

protocol DetailWeatherViewInput: AnyObject {
    func set()
}

// MARK: - DetailWeatherViewOutPut

protocol DetailWeatherViewOutPut: AnyObject {
}

// MARK: - DetailWeatherView

class DetailWeatherView: UIView {
    
    // MARK: - Private properties
    
    private var cityTitleLabel = UILabel()
    private var mainTempLable = UILabel()
    private var detailInfoTableView = UITableView()
    
    // MARK: - Controller
    
    weak var controller: DetailWeatherViewOutPut!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setCityTitleLabbel() {
        cityTitleLabel.numberOfLines = 0
        self.addSubview(cityTitleLabel)
        cityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cityTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        cityTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        cityTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    private func setMainTempLabel() {
        mainTempLable.numberOfLines = 0
        self.addSubview(mainTempLable)
        mainTempLable.translatesAutoresizingMaskIntoConstraints = false
        mainTempLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: self.frame.height/2).isActive = true
        mainTempLable.centerXAnchor.constraint(equalTo: cityTitleLabel.centerXAnchor).isActive = true
    }
    
    private func setDetailTableView() {
        
        detailInfoTableView.delegate = self
        detailInfoTableView.dataSource = self
        self.addSubview(detailInfoTableView)
        detailInfoTableView.translatesAutoresizingMaskIntoConstraints = false
        detailInfoTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        detailInfoTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        detailInfoTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height/2).isActive = true
        detailInfoTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setViews() {
        setCityTitleLabbel()
        setMainTempLabel()
        setDetailTableView()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailWeatherView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

// MARK: - DetailWeatherViewInput

extension DetailWeatherView: DetailWeatherViewInput {
    
    func set() {
        setViews()
    }
}
