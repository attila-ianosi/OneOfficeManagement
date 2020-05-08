//
//  SeeEmployeesVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 28/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class SeeEmployeeVC: UIViewController {
    //MARK: Passed Variable
    var eFullName = ""
    var ePosition = ""
    var eTitle = ""
    var eEmail = ""
    var eDOB = ""
    var eTelephone = ""
    var ePassword = ""
    var eAddress = ""
    var ePostCode = ""
    var eCity = ""
    var eStartDate = ""
    var eEndDate = ""
    //MARK: Services Outlet
    @IBOutlet weak var eFullNameLabel: UILabel!
    @IBOutlet weak var ePositionLabel: UILabel!
    @IBOutlet weak var eTitleLabel: UILabel!
    @IBOutlet weak var eEmailLabel: UILabel!
    @IBOutlet weak var eDOBLabel: UILabel!
    @IBOutlet weak var eTelephoneLabel: UILabel!
    @IBOutlet weak var ePasswordLabel: UILabel!
    @IBOutlet weak var eAddressLabel: UILabel!
    @IBOutlet weak var ePostCodeLabel: UILabel!
    @IBOutlet weak var eCityLabel: UILabel!
    @IBOutlet weak var eStartDateLabel: UILabel!
    @IBOutlet weak var eEndDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Labels to be showed
        eFullNameLabel.text = eFullName
        ePositionLabel.text = ePosition
        eTitleLabel.text = eTitle
        eEmailLabel.text = eEmail
        eDOBLabel.text = eDOB
        eTelephoneLabel.text = eTelephone
        ePasswordLabel.text = ePassword
        eAddressLabel.text = eAddress
        ePostCodeLabel.text = ePostCode
        eCityLabel.text = eCity
        eStartDateLabel.text = eStartDate
        eEndDateLabel.text = eEndDate
    }
}
