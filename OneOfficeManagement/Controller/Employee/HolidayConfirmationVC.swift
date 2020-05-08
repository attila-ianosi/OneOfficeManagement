//
//  HolidayConfirmationVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 23/03/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class HolidayConfirmationVC: UIViewController {
    //MARK: Passed variables
    var leaveDateSelected = ""
    var returnDateSelected = ""

    @IBOutlet weak var holidayDatesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Label confirmation
        holidayDatesLabel.text = "\(leaveDateSelected) - \(returnDateSelected)"
    }

    @IBAction func seeHistoryHolidays(_ sender: UIButton) {
        performSegue(withIdentifier: "goToHolidayHistory", sender: self)
    }
    
    @IBAction func returnToHomeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goMainMenuFromHoliday", sender: self)
    }
}
