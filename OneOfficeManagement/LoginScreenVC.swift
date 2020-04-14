//
//  ViewController.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController {

    @IBOutlet weak var appLogoLogin: UIImageView!
    
    @IBOutlet weak var userDetailsTextField: UITextField!
    
    @IBOutlet weak var passwordDetailsTextField: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       signInBtn.layer.cornerRadius = 10.0
        
    }

    @IBAction func signInBtnPressed(_ sender: UIButton) {
        
    }
    
}

