//
//  RequestManager.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/10/20.
//

import Foundation
import Alamofire

final class RequestManager {
    
    static let shared = RequestManager()
    
    static func getWeather(lat: Double, lon: Double, completion: @escaping (MainWeatherModel) -> ()) {
        
        let params = "lat=\(lat)&lon=\(lon)&appid=471728343ced4e53b2ac2526d0c8cae3&lang=ru".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        
        guard let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?" + params) else { return }
        
        AF.request(baseURL, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(_):
                
                let decode = JSONDecoder()
                if let data = response.data {
                    
                    guard let weatherData = try? decode.decode(MainWeatherModel.self, from: data) else {
                        print("false")
                        return }
                    completion(weatherData)
                }
                
            case .failure(_):
                
                guard let error = response.error else { return }
                print(error)
            }
            
        }
    }
    
}
