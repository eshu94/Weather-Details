//
//  WeatherListViewModel.swift
//  Weather-Details
//
//  Created by ESHITA on 10/02/21.
//

import Foundation

struct WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeather(_ vm: WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    mutating private func toCelcius() {
        
      weatherViewModels =  weatherViewModels.map { vm in
            
            var weatherviewmodel = vm
            weatherviewmodel.tempDetails.temperature = (weatherviewmodel.tempDetails.temperature - 32) * 5/9
            weatherviewmodel.tempDetails.tempMax = (weatherviewmodel.tempDetails.tempMax - 32) * 5/9
            weatherviewmodel.tempDetails.tempMin = (weatherviewmodel.tempDetails.tempMin - 32) * 5/9
            
            return weatherviewmodel
            
        }
    }
    
    mutating private func toFarenheit() {
        
      weatherViewModels =  weatherViewModels.map { vm in
            
            var weatherviewmodel = vm
            weatherviewmodel.tempDetails.temperature = (weatherviewmodel.tempDetails.temperature  *  9/5)  +  32
            weatherviewmodel.tempDetails.tempMax = (weatherviewmodel.tempDetails.tempMax *  9/5)  +  32
            weatherviewmodel.tempDetails.tempMin = (weatherviewmodel.tempDetails.tempMin *  9/5)  +  32
            
            return weatherviewmodel
            
        }
    }
    
    
    mutating func updateUnits(to unit:Unit){
        switch unit {
        case .celcius:
            toCelcius()
        case .farenheit:
            toFarenheit()
        }
    }
}

struct WeatherViewModel: Decodable {
    
    let name: String
    var tempDetails: TemperatureViewModel
    var weatherData: [WeatherDescpViewModel]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case tempDetails = "main"
        case weatherData = "weather"
    }
}

struct TemperatureViewModel: Decodable {
    
    var temperature: Double
    var tempMin: Double
    var tempMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}

struct WeatherDescpViewModel: Decodable {
    var description: String
}
