//
//  ReportSalesVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class ReportSalesVC: UIViewController, UITextFieldDelegate {
    
    private var datePicker: UIDatePicker?
    var dateReport = ""
    var salesFigures: Results<Figure>!

    @IBOutlet weak var reportDate: UITextField!
    @IBOutlet weak var specialDelivery: UITextField!
    @IBOutlet weak var internationalPost: UITextField!
    @IBOutlet weak var parcelForce: UITextField!
    @IBOutlet weak var globalExpress: UITextField!
    @IBOutlet weak var moneyGram: UITextField!
    @IBOutlet weak var firstClass: UITextField!
    @IBOutlet weak var secondClass: UITextField!
    @IBOutlet weak var royalMailSignedFor: UITextField!
    @IBOutlet weak var travelMoneyCard: UITextField!
    @IBOutlet weak var travelInsurance: UITextField!
    
    func configure(with reportSales: Figure){
          
        reportDate.text = reportSales.reportDate
        specialDelivery.text = reportSales.specialDelivery
        internationalPost.text = reportSales.internationalPost
        parcelForce.text = reportSales.parcelForce
        globalExpress.text = reportSales.globalExpress
        moneyGram.text = reportSales.moneyGram
        firstClass.text = reportSales.firstClass
        secondClass.text = reportSales.secondClass
        royalMailSignedFor.text = reportSales.royalMailSignedFor
        travelMoneyCard.text = reportSales.travelMoneyCard
        travelInsurance.text = reportSales.travelInsurance
        
      }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
              // Realm Database Initialization
              let realm = RealmService.shared.realm
              salesFigures = realm.objects(Figure.self)
        
              // Date Picker
               datePicker = UIDatePicker()
               datePicker?.datePickerMode = .date
               datePicker?.addTarget(self, action: #selector(ReportSalesVC.dateChanged(datePicker:)), for: .valueChanged)
               reportDate.inputView = datePicker
        
              //Push the texfields
              NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
              NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
               
    }
    
    // Function that helps the Date Picker
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        reportDate.text = dateFormatter.string(from: datePicker.date)
    }

    @IBAction func submitSalesBtnPressed(_ sender: UIButton) {
        
        
        let newSalesReport = Figure(reportDate: reportDate.text!, specialDelivery: specialDelivery.text!, internationalPost: internationalPost.text!, parcelForce: parcelForce.text!, globalExpress: globalExpress.text!, moneyGram: moneyGram.text!, firstClass: firstClass.text!, secondClass: secondClass.text!, royalMailSignedFor: royalMailSignedFor.text!, travelMoneyCard: travelMoneyCard.text!, travelInsurance: travelInsurance.text!)
            //Add new report to database
            RealmService.shared.create(newSalesReport)
        
            self.dateReport = reportDate.text!
        
        if reportDate.text == "" {
            createAlert(title: "Warning", message: "Report Date Missing")
        } else {
            
            performSegue(withIdentifier: "goToConfirmationSales", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              let vc = segue.destination as! ConfirmationReportSalesVC
              vc.finalDate = self.dateReport
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func createAlert(title: String, message: String){
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { (action) in
              alert.dismiss(animated: true, completion: nil)
          }))
          self.present(alert, animated: true, completion: nil)
      }
    
}

