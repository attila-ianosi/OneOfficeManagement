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
    
    var employeeNameToSee = ""
    var notesToSee = ""
    let realm = RealmService.shared.realm
    //MARK: Holidays Array
    var holidays : Results<Holiday>!
    //MARK: Tableview Outlet
    @IBOutlet weak var seeHolidaysTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Tableview Delegates
        seeHolidaysTableView.dataSource = self
        seeHolidaysTableView.delegate = self
        //MARK: Holiday Array READ operation
        holidays = realm.objects(Holiday.self)
        //MARK: Reloading Data Always
        seeHolidaysTableView.reloadData()
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMainMenuFromHolidays", sender: self)
    }
    //MARK: Function for number of rows in the Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    //MARK: Function for the ReusableCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell", for: indexPath)
        if let item = holidays?[indexPath.row]{
            cell.textLabel?.text = item.leaveDateHoliday + " - " + item.returnDateHoliday + " (\(item.employeeName)) "
        } else {
            cell.textLabel?.text = "There is no Holidays"
        }
        return cell
    }
    //MARK: Function to perform when selecting a tableView Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if let item = holidays?[indexPath.row]{
               notesToSee = item.extraNotesHoliday
               employeeNameToSee = item.employeeName
               }
        createAlert(title: "\(employeeNameToSee)", message: "\(notesToSee)")
    }
    //MARK: Editing Option in case o deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                     forRowAt indexPath: IndexPath) {
              if editingStyle == .delete {
                      //MARK: DELETE operation in REALM
                      RealmService.shared.delete(holidays[indexPath.row])
              }
              //MARK: Reloading the tableView
              seeHolidaysTableView.reloadData()
          }
    //MARK: The alert function
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
