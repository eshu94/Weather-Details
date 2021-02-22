//
//  SettingsViewModel.swift
//  Weather-Details
//
//  Created by ESHITA on 11/02/21.
//

import Foundation

enum Unit: String, CaseIterable {
    case celcius = "metric"
    case farenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self){
            case .celcius:
                return "Celcius"
            case .farenheit:
                return "Farenheit"
            }
        }
    }
    
}

struct SettingsViewModel {
    
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.farenheit
    
    var selectedUnit: Unit {
        get {
            let userDefault = UserDefaults.standard
            if let value = userDefault.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            return _selectedUnit
        }set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
    
}
