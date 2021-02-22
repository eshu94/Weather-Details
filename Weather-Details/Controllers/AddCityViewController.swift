//
//  AddCityViewController.swift
//  Weather-Details
//
//  Created by ESHITA on 10/02/21.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addweatherDidSave(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!

    var addWeatherDelegate : AddWeatherDelegate?
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        if let cityName = cityNameTextField.text {
            
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&APPID=YOUR_API_KEY&units=Imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherUrl) { data in
                
                
                let weatherVM = try! JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
                
            }
            WebService().load(resource: weatherResource) { [weak self] result in
                
                if let weatherVM = result {
                    
                    if let delegate = self?.addWeatherDelegate {
                        delegate.addweatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
                
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
