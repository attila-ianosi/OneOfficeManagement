//
//  ConfirmationReportSalesVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/03/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmationReportSalesVC: UIViewController {
    
    var finalDate = ""
    //MARK: Label Outlet
    @IBOutlet weak var confimationSalesReport: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Label with confirmation date
        confimationSalesReport.text = "\(finalDate)"
    }
    //MARK: See report button
    @IBAction func seeReportsBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToReportsHistory", sender: self)
    }
    //MARK: Main Menu Button
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMainMenuFromReport", sender: self)
    }
}
