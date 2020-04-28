//
//  CreateBranchInfoVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class CreateBranchInfoVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var messageSubject = ""
    var messages: Results<Message>!
    
    @IBOutlet weak var subjectLabelBranchInfo: UITextField!
    @IBOutlet weak var messageBodyTxt: UITextView!
    @IBOutlet weak var dateOfMessage: UITextField!
    @IBOutlet weak var managerTextField: UITextField!
    
    func configure(with messages: Message){

        subjectLabelBranchInfo.text = messages.subjectInfo
        messageBodyTxt.text = messages.messageInfo
      //  dateOfMessage.text = dateToString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //Delegate for UITextfield
        self.subjectLabelBranchInfo.delegate = self
        self.messageBodyTxt.delegate = self
        
      print(Realm.Configuration.defaultConfiguration.fileURL!)
//        /Users/attila.ianosi/Library/Developer/CoreSimulator/Devices/288128F7-C88F-4248-A85C-419AED9998F2/data/Containers/Data/Application/2BC74C77-6FAC-4157-AD16-A45FAD063E74/Documents/default.realm
        let realm = RealmService.shared.realm
        messages = realm.objects(Message.self)
    }
    
    @IBAction func submitInfoPressed(_ sender: UIButton) {
        
        let newMessage = Message(subjectInfo: subjectLabelBranchInfo.text!, messageInfo: messageBodyTxt.text!, dateOfMessage: Date(), managerInfo: managerTextField.text!)
            
        RealmService.shared.create(newMessage)
        self.messageSubject = subjectLabelBranchInfo.text!
        
        performSegue(withIdentifier: "gotoMessageConfirmation", sender: self)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ConfirmBranchInfoDoneVC
            vc.finalMessage = self.messageSubject
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


    


