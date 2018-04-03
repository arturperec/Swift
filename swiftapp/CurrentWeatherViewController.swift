//
//  CurrentWeatherViewController.swift
//  swiftapp
//
//  Created by Artur Pereć on 28/03/2018.
//  Copyright © 2018 Artur Pereć. All rights reserved.
//

import UIKit

var currentCityName: String?
var currentCityLatitude: Double?
var currentCityLongitude: Double?
var isTemperatureFahrenheit = true

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    @IBAction func changeTemperature(_ sender: UIButton) {
        isTemperatureFahrenheit = !isTemperatureFahrenheit
        viewDidLoad()
    }
    @IBAction func gotoAbout(_ sender: UIButton) {
    }
    
    let forecastAPIKey = "3bc39cbe99b7893f47cb00f6da8a3bd5"
    let coordinate: (latitude: Double, longitude: Double) = (currentCityLatitude!, currentCityLongitude!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityTextLabel.text = currentCityName
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.latitude, longitude: coordinate.longitude) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        if isTemperatureFahrenheit {
                            self.temperatureLabel.text = "\(temperature)°"
                            self.temperatureScaleLabel.text = "FAHRENHEIT"
                        } else {
                            self.temperatureLabel.text = "\((temperature - 32) * 5/9)°"
                            self.temperatureScaleLabel.text = "CELSIUS"
                        }
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
    }

    
}
