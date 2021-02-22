//
//  DoublePlusExtension.swift
//  Weather-Details
//
//  Created by ESHITA on 11/02/21.
//

import Foundation

extension Double {
    
    var formatasDegree: String {
        return String(format: "%.0f°", self)
    }
}
