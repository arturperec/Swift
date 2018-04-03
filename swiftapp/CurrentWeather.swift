//
//  CurrentWeather.swift
//  swiftapp
//
//  Created by Artur Pereć on 28/03/2018.
//  Copyright © 2018 Artur Pereć. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    init(weatherDictionary: [String: Any])
    {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
    
    /* Test Data
     {
         "time":1522249846,
         "summary":"Clear",
         "icon":"clear-day",
         "nearestStormDistance":444,
         "nearestStormBearing":357,
         "precipIntensity":0,
         "precipProbability":0,
         "temperature":52.97,
         "apparentTemperature":52.97,
         "dewPoint":45.67,
         "humidity":0.76,
         "pressure":1021.78,
         "windSpeed":1.56,
         "windGust":4.19,
         "windBearing":92,
         "cloudCover":0.18,
         "uvIndex":0,
         "visibility":9.18,
         "ozone":335.85
     }
     */
}
