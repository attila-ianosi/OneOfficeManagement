//
//  OpenMessageVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 21/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class OpenMessageVC: UIViewController, UITextFieldDelegate {
    
      var finalsubjectInfo = ""
      var finalMessageSubject = ""
      var messages : Results<Message>!
      let realm = RealmService.shared.realm
       
       @IBOutlet weak var seeInfoSubject: UILabel!
       
       @IBOutlet weak var seeMessageSubject: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        seeInfoSubject.text = "\(finalsubjectInfo)"
        seeMessageSubject.text = "\(finalMessageSubject)"
    }

    @IBAction func mainMenuPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToMainMenuAfterReadMessage", sender: self)
    }
}
