//
//  CitiesViewController.swift
//  swiftapp
//
//  Created by Artur Pereć on 03/04/2018.
//  Copyright © 2018 Artur Pereć. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBAction func cityPoznan(_ sender: UIButton) {
        currentCityName = "Los Poznanios"
        currentCityLatitude = 52.3914288
        currentCityLongitude = 16.8558904
    }
    @IBAction func cityWarsaw(_ sender: UIButton) {
        currentCityName = "(L)egiunia"
        currentCityLatitude = 52.2356264
        currentCityLongitude = 20.9958866
    }
    @IBAction func cityNewYork(_ sender: UIButton) {
        currentCityName = "Nju Jork"
        currentCityLatitude = 40.8517687
        currentCityLongitude = -73.9109735
    }
    @IBAction func cityPaloAlto(_ sender: UIButton) {
        currentCityName = "Los Applos"
        currentCityLatitude = 37.3318242
        currentCityLongitude = -122.0333687
    }
}
