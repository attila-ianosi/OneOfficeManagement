//
//  EmployeeUserInfoVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class CreateUserVC: UIViewController, UITextFieldDelegate {
   
    //private var datePicker: UIDatePicker?
    var userName = ""
    var user: Results<User>!
    
    @IBOutlet weak var titleEmployee: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var postcode: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var rolePosition: UITextField!
    
    
    func configure(with user: User){
        titleEmployee.text = user.titleM
        firstName.text = user.firstName
        middleName.text = user.middleName
        lastName.text = user.lastName
        email.text = user.email
        dateOfBirth.text = user.dateOfBirth
        telephone.text = user.telephone
        password.text = user.password
        address.text = user.address
        postcode.text = user.postcode
        city.text = user.city
        startDate.text = user.startDate
        endDate.text = user.endDate
        rolePosition.text = user.rolePosition
        
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()

      
    print(Realm.Configuration.defaultConfiguration.fileURL!)
             let realm = RealmService.shared.realm
             user = realm.objects(User.self)
           
            // Date Picker
//            datePicker = UIDatePicker()
//            datePicker?.datePickerMode = .date
//            datePicker?.addTarget(self, action: #selector(ReportSalesVC.dateChanged(datePicker:)), for: .valueChanged)
//            startDate.inputView = datePicker
//            dateOfBirth.inputView = datePicker
//            endDate.inputView = datePicker
                    
    }
    
    // Function that helps the Date Picker
//       @objc func dateChanged(datePicker: UIDatePicker) {
//           let dateFormatter = DateFormatter()
//           dateFormatter.dateFormat = "dd.MM.yyyy"
//           startDate.text = dateFormatter.string(from: datePicker.date)
//           dateOfBirth.text = dateFormatter.string(from: datePicker.date)
//           endDate.text = dateFormatter.string(from: datePicker.date)
//       }
    
    
    @IBAction func createUserButton(_ sender: UIButton) {
    
     
        let newUser = User(titleM: titleEmployee.text!, firstName: firstName.text!, middleName: middleName.text!, lastName: lastName.text!, email: email.text!, dateOfBirth: dateOfBirth.text!, telephone: telephone.text!, password: password.text!, address: address.text!, postcode: postcode.text!, city: city.text!, startDate: startDate.text!, endDate: endDate.text!, rolePosition: rolePosition.text!)
        
        RealmService.shared.create(newUser)
    
        self.userName = firstName.text!
        
        if let email2 = email.text, let password2 = password.text {
            Auth.auth().createUser(withEmail: email2, password: password2) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    print("user created")
                }
            }
        }
           performSegue(withIdentifier: "goToConfirmationUser", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ConfirmationUserCreatedVC
        vc.finalUserName = self.userName
    }
    //Hides Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Hide Keyboard when user touches RETURN key
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

