//
//  SeeHolidayVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 23/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class SeeHolidayVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var seeHolidaysTableView: UITableView!
    
      var employeeNameToSee = ""
      var notesToSee = ""
      let realm = RealmService.shared.realm
      var holidays : Results<Holiday>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seeHolidaysTableView.dataSource = self
        seeHolidaysTableView.delegate = self
        
        holidays = realm.objects(Holiday.self)
        seeHolidaysTableView.reloadData()
        
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToMainMenuFromHolidays", sender: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell", for: indexPath)
        if let item = holidays?[indexPath.row]{
            cell.textLabel?.text = item.leaveDateHoliday + " - " + item.returnDateHoliday + " (\(item.employeeName)) "
            
        } else {
            cell.textLabel?.text = "There is no Holidays"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if let item = holidays?[indexPath.row]{
               notesToSee = item.extraNotesHoliday
            employeeNameToSee = item.employeeName
               }
        createAlert(title: "\(employeeNameToSee)", message: "\(notesToSee)")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
              if editingStyle == .delete {
                  
                      RealmService.shared.delete(holidays[indexPath.row])
              }
              
              seeHolidaysTableView.reloadData()
          }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
