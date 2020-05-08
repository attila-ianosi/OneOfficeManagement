//
//  DirectorTabBar.swift
//  OneOfficeManagement
//
//  Created by Attila I on 24/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import Firebase
      //MARK: Tab bar customization page
class HomeTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      //MARK: Hiding the BACK button after login
        navigationItem.hidesBackButton = true
    }
    //MARK: LOG OUT button
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
    //MARK: The Sign Out firebase function
    do {
      try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
  }
}
