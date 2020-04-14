//
//  EmployeeMainMenuVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class EmployeeMainMenuVC: UIViewController {

    @IBOutlet weak var branchFocusBtn: UIButton!
    
    @IBOutlet weak var holidayBookingBtn: UIButton!
    
    @IBOutlet weak var pocketBtn: UIButton!
    
    @IBOutlet weak var userInfoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     branchFocusBtn.layer.cornerRadius = 21
        holidayBookingBtn.layer.cornerRadius = 21
        pocketBtn.layer.cornerRadius = 21
        userInfoBtn.layer.cornerRadius = 21
       
    }
    
    @IBAction func branchFocusBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func holidayBookingPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func pocketBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func userInfoBtnPressed(_ sender: UIButton) {
        
        
    }
    
}
