//
//  WeatherListTableViewController.swift
//  Weather-Details
//
//  Created by ESHITA on 10/02/21.
//

import Foundation
import UIKit

class WeatherListTableViewController : UITableViewController, AddWeatherDelegate, SettingsDelegate {
   
    var weatherListVM = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Protocols funtions
    
    func addweatherDidSave(vm: WeatherViewModel) {
        self.weatherListVM.addWeather(vm)
        self.tableView.reloadData()
    }
    
    func settingsDone(_vm: SettingsViewModel) {
        
        self.weatherListVM.updateUnits(to:  _vm.selectedUnit)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addCityVCSegue" {
            prepareSegueforAddCityVC(segue)
            
        }else if segue.identifier == "settingsTableVCSegue" {
            prepareSegueforSettingsTableVC(segue)
        }
      
    }
    
    //Functions for segues
    private  func prepareSegueforSettingsTableVC(_ segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as?  UINavigationController else {
            fatalError("Navigation controller not found")
        }
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("View controller not found")
        }
        settingsTableVC.delegate = self
        
    }
  private  func prepareSegueforAddCityVC(_ segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as?  UINavigationController else {
            fatalError("Navigation controller not found")
        }
        guard let addweathercityVC = nav.viewControllers.first as? AddCityViewController else {
            fatalError("View controller not found")
        }
        addweathercityVC.addWeatherDelegate = self
        
    }
    
    
    //Functions for TableView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListVM.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListVM.modelAt(indexPath.row)
        cell.setup(weatherVM)
         return cell
    }
}
