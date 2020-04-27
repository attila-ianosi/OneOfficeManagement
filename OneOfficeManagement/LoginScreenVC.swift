//
//  ViewController.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import Firebase

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
        
        if  let email = userDetailsTextField.text, let password = passwordDetailsTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                     guard let self = self else { return }
                      
                if let e = error {
                    print(e)
                } else if email == "1@2.com", password == "123456" {
                    
                    self.performSegue(withIdentifier: "goToDirectorPage", sender: self)
                } else if email == "angel@love.com", password == "123456"{
                   
                    self.performSegue(withIdentifier: "goToManagerPage", sender: self)
                    
                } else {
                    self.performSegue(withIdentifier: "goToEmployeePage", sender: self)
                }
        }
    
        
    }
    
}
    
 
    
    
    //Hides Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Hide Keyboard when user touches RETURN key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }

}
