//
//  EmployeeHolidayBookingVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift



class UserListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    let realm = RealmService.shared.realm
    var user : Results<User>!
    
    var eFullNameToBePassed = ""
    var ePositionToBePassed = ""
    var eTitleToBePassed = ""
    var eEmailToBePassed = ""
    var eDOBToBePassed = ""
    var eTelephoneToBePassed = ""
    var ePasswordToBePassed = ""
    var eAddressToBePassed = ""
    var ePostCodeToBePassed = ""
    var eCityToBePassed = ""
    var eStartDateToBePassed = ""
    var eEndDateToBePassed = ""

    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListTableView.dataSource = self
        userListTableView.delegate = self
        user = realm.objects(User.self)
        userListTableView.reloadData()
        
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        
     performSegue(withIdentifier: "goToMainMenuFromUserList", sender: self)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
    return user.count
     }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath)
        if let item = user?[indexPath.row]{
            cell.textLabel?.text = item.firstName + " " + item.lastName + "  " + "(\(item.rolePosition))"
        } else{
            cell.textLabel?.text = "No user Added"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             
        if let item = user?[indexPath.row]{
               
            eFullNameToBePassed = item.firstName + "  " + item.lastName
            ePositionToBePassed = item.rolePosition
            eTitleToBePassed = item.titleM
            eEmailToBePassed = item.email
            eDOBToBePassed = item.dateOfBirth
            eTelephoneToBePassed = item.telephone
            ePasswordToBePassed = item.password
            eAddressToBePassed = item.address
            ePostCodeToBePassed = item.postcode
            eCityToBePassed = item.city
            eStartDateToBePassed = item.startDate
            eEndDateToBePassed = item.endDate ?? "Still Working"
        }
             
             performSegue(withIdentifier: "goToSeeEmployeeDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

                RealmService.shared.delete(user[indexPath.row])
        }
        
        userListTableView.reloadData()
    }
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               
               if (segue.identifier == "goToSeeEmployeeDetails") {
                   
                 let vc = segue.destination as! SeeEmployeesVC
                
                vc.eFullName = eFullNameToBePassed
                vc.ePosition = ePositionToBePassed
                vc.eTitle = eTitleToBePassed
                vc.eEmail = eEmailToBePassed
                vc.eDOB = eDOBToBePassed
                vc.eTelephone = eTelephoneToBePassed
                vc.ePassword = ePasswordToBePassed
                vc.eAddress = eAddressToBePassed
                vc.ePostCode = ePostCodeToBePassed
                vc.eCity = eCityToBePassed
                vc.eStartDate = eStartDateToBePassed
                vc.eEndDate = eEndDateToBePassed
        }
    }
}
   

     


