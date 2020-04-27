//
//  ConfirmationReportSalesVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmationReportSalesVC: UIViewController {
    
    var finalDate = ""

    @IBOutlet weak var confimationSalesReport: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        confimationSalesReport.text = "\(finalDate)"
        
    }
    
 

    @IBAction func seeReportsBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToReportsHistory", sender: self)
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToMainMenuFromReport", sender: self)
    }
    
}
