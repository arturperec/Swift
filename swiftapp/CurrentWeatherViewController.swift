//
//  CurrentWeatherViewController.swift
//  swiftapp
//
//  Created by Artur Pereć on 28/03/2018.
//  Copyright © 2018 Artur Pereć. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var isTemperatureFahrenheit = true
    
    @IBAction func changeTemperature(_ sender: UIButton) {
        isTemperatureFahrenheit = !isTemperatureFahrenheit
        viewDidLoad()
    }
    @IBAction func gotoAbout(_ sender: UIButton) {
    }
    //TODO: 
        //Add Button on temperature to change temp to Celsius
        //Add Button on cityname to change city to Poznan / Warsaw / Los Angeles or add a label to add ur own city.
        //Add Button on Veare to go to the ViewController (about with info about programmer)
    //Testing Data
    let forecastAPIKey = "3bc39cbe99b7893f47cb00f6da8a3bd5"
    let coordinate: (latitude: Double, longitude: Double) = (37.8267, -122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.latitude, longitude: coordinate.longitude) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature {
                        if self.isTemperatureFahrenheit {
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

        // Do any additional setup after loading the view.
    }

    
}
