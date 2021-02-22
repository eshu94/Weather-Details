//
//  WeatherCell.swift
//  Weather-Details
//
//  Created by ESHITA on 10/02/21.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tempMinLabel: UILabel!
    
    @IBOutlet weak var tempMaxLabel: UILabel!
    
    func setup(_ vm: WeatherViewModel) {
        
        self.cityNameLabel.text =  vm.name //"Bangalore"
        self.temperatureLabel.text =  "\(vm.tempDetails.temperature.formatasDegree)" //"78°"
        self.descriptionLabel.text =  vm.weatherData[0].description.capitalized  //desc.capitalized
        self.tempMaxLabel.text = "Max:"+"\(vm.tempDetails.tempMax.formatasDegree)"
        self.tempMinLabel.text = "Min:"+"\(vm.tempDetails.tempMin.formatasDegree)"
        
    }
}
