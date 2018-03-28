//
//  ForecastService.swift
//  swiftapp
//
//  Created by Artur Pereć on 28/03/2018.
//  Copyright © 2018 Artur Pereć. All rights reserved.
//

import Foundation

class ForecastService
{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    //forecastBaseURL/forecastAPIKey/latitude,logitude
    
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)") //tutaj string z niewiadomych przyczyn gubi jeden znak, zatem dopisałem 0 na początku stringa
                                                                                        //wiem, że nie jest to zbyt dobre rozwiązanie, ale nie mogłem znaleźć przyczyny.
                                                                                        //jednak i tak wyrzuca error unexpected URL
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)"/*, relativeTo: forecastBaseURL!*/) {
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String : Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
            })
        }
    }
}
