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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
