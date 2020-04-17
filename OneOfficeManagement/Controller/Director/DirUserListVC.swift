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
    
//    var selectedUser: User {
//        didSet{
//            user = realm.objects(User.self)
//            userListTableView.reloadData()
//        }
//    }


    @IBOutlet weak var userListTableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
     user = realm.objects(User.self)
     userListTableView.reloadData()
        
    }
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
    return user.count
     }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath)
        if let item = user?[indexPath.row]{
            cell.textLabel?.text = item.firstName
        } else{
            cell.textLabel?.text = "No user Added"
        }
        return cell
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell") as? UserListCell{
//
//            let userShowed = user[indexPath.row]
//            cell.updateUser(user: userShowed)
//
//                   return cell
//               } else {
//                   return BranchInfoCell()
//               }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
       
   }
     


