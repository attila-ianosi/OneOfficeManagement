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
      
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
    do {
      try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }

   }
}
