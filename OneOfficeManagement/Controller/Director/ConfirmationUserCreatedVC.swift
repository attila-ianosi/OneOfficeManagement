//
//  ConfirmationUserCreatedVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 16/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmationUserCreatedVC: UIViewController {

    var finalUserName = ""
    
 
    @IBOutlet weak var confirmationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmationLabel.text = "User \(finalUserName) has been created"
       
    }
    
    @IBAction func seeUsersBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "seeUsersList", sender: self)
        
    }
    

}
