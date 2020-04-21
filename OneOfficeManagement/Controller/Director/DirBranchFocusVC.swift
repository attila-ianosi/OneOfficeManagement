//
//  EmployeeBranchFocusVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class DirBranchFocusVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var messages : Results<Message>!
    let realm = RealmService.shared.realm
    var subjectToShow = ""
    var bodyMessage = ""
    
    
    @IBOutlet weak var branchFocusTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        branchFocusTableView.dataSource = self
        branchFocusTableView.delegate = self
        messages = realm.objects(Message.self)
        branchFocusTableView.reloadData()
       

        
    }
    
    @IBAction func addBranchInfo(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "goToAddBranchInfo", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BranchInfoCell", for: indexPath) as? BranchInfoCell {
               
                   let item = messages?[indexPath.row].subjectInfo
                   let bodyMessage = messages?[indexPath.row].messageInfo
                   
                       
                   cell.subjectTitle.text = item
                   cell.managerName.text = "Harshil Deocamdata"
                   cell.contentMessage.text = bodyMessage
                   tableView.rowHeight = 100
                   cell.layer.cornerRadius = 8
            
                       return cell
                       
                     } else{
                         
                        return BranchInfoCell()
                     }

    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              let indexPath = tableView.indexPathForSelectedRow
               let currentCell = tableView.cellForRow(at: indexPath!)! as! BranchInfoCell
               
               subjectToShow = currentCell.subjectTitle.text!
               bodyMessage = currentCell.contentMessage.text!
           
               performSegue(withIdentifier: "goToSeeBranchInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           if (segue.identifier == "goToSeeBranchInfo") {
               
               let viewController = segue.destination as! OpenMessageVC
               
               viewController.finalsubjectInfo = subjectToShow
               viewController.finalMessageSubject = bodyMessage
               
           }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                 if editingStyle == .delete {
                     
                         RealmService.shared.delete(messages[indexPath.row])
                 }

       }

  }
}
