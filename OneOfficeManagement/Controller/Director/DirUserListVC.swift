//
//  EmployeeHolidayBookingVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift



class DirUserListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
 
    let realm = RealmService.shared.realm
    var user : Results<User>!

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
            cell.textLabel?.text = item.firstName + " " + item.lastName
        } else{
            cell.textLabel?.text = "No user Added"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  let userPicked = user[indexPath.row]
    
       // performSegue(withIdentifier: "goToUserDetails", sender: userPicked)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
                RealmService.shared.delete(user[indexPath.row])
        }
        
        userListTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //  let vc = segue.destination as! DirCreateUserVC
       // vc.firstName = user[IndexPath.row].firstName
       }
}
   

     


