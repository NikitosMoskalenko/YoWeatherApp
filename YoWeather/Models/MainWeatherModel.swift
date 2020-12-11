//
//  MainWeatherModel.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/10/20.
//

import Foundation

protocol MainWeatherModelProtocol {
    
}

final class MainWeatherModel: Codable, MainWeatherModelProtocol {
    
    var coord: Coord?
    var weather: [Weather]
    var main: MainParams?
    var wind: WindSpeed?
    var sys: SunInfo?
    var name: String = ""
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.coord = try container.decodeIfPresent(Coord.self, forKey: .coord)
        self.weather = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? []
        self.main = try container.decodeIfPresent(MainParams.self, forKey: .main)
        self.wind = try container.decodeIfPresent(WindSpeed.self, forKey: .wind)
        self.sys = try container.decodeIfPresent(SunInfo.self, forKey: .sys)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}

struct Coord: Codable {
    var lon: Double
    var lat: Double
    
    init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lon = try container.decodeIfPresent(Double.self, forKey: .lon) ?? 0.0
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat) ?? 0.0
    }
}

struct Weather: Codable {
    var description: String
    var icon: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
    }
}

struct MainParams: Codable {
    
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.temp = try container.decodeIfPresent(Double.self, forKey: .temp) ?? 0.0
        self.feels_like = try container.decodeIfPresent(Double.self, forKey: .feels_like) ?? 0.0
        self.temp_max = try container.decodeIfPresent(Double.self, forKey: .temp_max) ?? 0.0
        self.temp_min = try container.decodeIfPresent(Double.self, forKey: .temp_min) ?? 0.0
    }
}

struct WindSpeed: Codable {
    var speed: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed) ?? 0.0
    }
}

struct SunInfo: Codable {
    var sunrise: Int
    var sunset: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.sunrise = try container.decodeIfPresent(Int.self, forKey: .sunrise) ?? 0
        self.sunset = try container.decodeIfPresent(Int.self, forKey: .sunset) ?? 0
    }
}

/*
 
 api.openweathermap.org/data/2.5/weather?id=2172797&appid=76d0aa99806d725b36c13e9210ea28a7&lang=ru
 api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=76d0aa99806d725b36c13e9210ea28a7&lang=ru

 {
 
 
     "coord": {
         "lon": 145.77,
         "lat": -16.92
     },
     "weather": [
         {
             "id": 804,
             "main": "Clouds",
             "description": "пасмурно",
             "icon": "04n"
         }
     ],
     "base": "stations",
     "main": {
 
         "temp": 298.92,
         "feels_like": 301.61,
         "temp_min": 298.71,
         "temp_max": 299.15,
         "pressure": 1012,
         "humidity": 78
     },
     "visibility": 10000,
     "wind": {
         "speed": 2.6,
         "deg": 170
     },
     "clouds": {
         "all": 95
     },
     "dt": 1607601107,
     "sys": {
         "type": 1,
         "id": 9490,
         "country": "AU",
 
 var sunrise: Int
 var sunset: Int
 
         "sunrise": 1607542588,
         "sunset": 1607589791
     },
     "timezone": 36000,
     "id": 2172797,
     "name": "Кернс",
     "cod": 200
 }
 
 */
