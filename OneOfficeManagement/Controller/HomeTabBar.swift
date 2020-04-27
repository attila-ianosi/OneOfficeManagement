//
//  DirectorTabBar.swift
//  OneOfficeManagement
//
//  Created by Attila I on 24/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import Firebase

class HomeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
        navigationController?.popViewController(animated: true)
          
    }
    

}
