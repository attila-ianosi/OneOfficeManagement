//
//  DirUserTypeVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 15/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class DirUserTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    @IBAction func managerTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToCreateUser", sender: self)
        
    }
    
    @IBAction func conterClerkTapped(_ sender: UIButton) {
    }
    

}
