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
        
              //Keyboard Texfield Delegates
//               self.reportDate.delegate = self
//               self.specialDelivery.delegate = self
//               self.internationalPost.delegate = self
//               self.parcelForce.delegate = self
//               self.globalExpress.delegate = self
//               self.moneyGram.delegate = self
//               self.firstClass.delegate = self
//               self.secondClass.delegate = self
//               self.royalMailSignedFor.delegate = self
//               self.travelMoneyCard.delegate = self
//               self.travelInsurance.delegate = self
              
              // Realm Database Initialization
              let realm = RealmService.shared.realm
              salesFigures = realm.objects(Figure.self)
        
    }
    

    @IBAction func submitSalesBtnPressed(_ sender: UIButton) {
        
        let newSalesReport = Figure(reportDate: reportDate.text!, specialDelivery: specialDelivery.text!, internationalPost: internationalPost.text!, parcelForce: parcelForce.text!, globalExpress: globalExpress.text!, moneyGram: moneyGram.text!, firstClass: firstClass.text!, secondClass: secondClass.text!, royalMailSignedFor: royalMailSignedFor.text!, travelMoneyCard: travelMoneyCard.text!, travelInsurance: travelInsurance.text!)
        
            RealmService.shared.create(newSalesReport)
        
        self.dateReport = reportDate.text!
            
           performSegue(withIdentifier: "goToConfirmationSales", sender: self)
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
    

}


