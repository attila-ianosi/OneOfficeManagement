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
    
    
    
    func configure(with messages: Message){
        
        subjectLabelBranchInfo.text = messages.subjectInfo
        messageBodyTxt.text = messages.messageInfo
        dateOfMessage.text = messages.dateOfMessage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate for UITextfield
        self.subjectLabelBranchInfo.delegate = self
        self.messageBodyTxt.delegate = self
        
      print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realm = RealmService.shared.realm
        messages = realm.objects(Message.self)
        

    }
    

    @IBAction func submitInfoPressed(_ sender: UIButton) {
        
        let newMessage = Message(subjectInfo: subjectLabelBranchInfo.text!, messageInfo: messageBodyTxt.text!, dateOfMessage: dateOfMessage.text!)
        
        RealmService.shared.create(newMessage)
        
        self.messageSubject = subjectLabelBranchInfo.text!
        
        performSegue(withIdentifier: "gotoMessageConfirmation", sender: self)
    
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ConfirmationMessageCreatedVC
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


    


