//
//  ManagerMainMenuVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ManagerMainMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func managerBranchFocusBtn(_ sender: UIButton) {
        
       performSegue(withIdentifier: "managerGoToBranchFocus", sender: self)
    }
    
    @IBAction func managerReportSalesBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToReportSalesManager", sender: self)
    }
    
    @IBAction func managerReportHistoryBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSalesHistoryManager", sender: self)
        
    }
    @IBAction func managerHolidayBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToHolidayMenuManager", sender: self)
        
    }
}
