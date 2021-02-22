//
//  SettingsTableViewController.swift
//  Weather-Details
//
//  Created by ESHITA on 11/02/21.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(_vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    var settingsVM = SettingsViewModel()
    var delegate: SettingsDelegate?
    
    @IBAction func done () {
        
        if let delegate = self.delegate {
            delegate.settingsDone(_vm: self.settingsVM)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Funtions for tableViews
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsVM = self.settingsVM.units[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        let settingsItem = self.settingsVM.units[indexPath.row]
        cell.textLabel?.text = settingsVM.displayName
        
        if settingsItem == self.settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
            
        }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncheck all cells
        tableView.visibleCells.forEach { (cell) in
            
            cell.accessoryType = .none
            
        }
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingsVM.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
