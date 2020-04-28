//
//  ReportOpenVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 24/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ReportOpenVC: UIViewController {
    
    var dateReport = ""
    var specialD = ""
    var internationalP = ""
    var parcelF = ""
    var globalX = ""
    var moneyG = ""
    var firstCL = ""
    var secondCl = ""
    var royalMSF = ""
    var tmc = ""
    var travelIns = ""


    @IBOutlet weak var dateReportLbl: UILabel!
    @IBOutlet weak var specialDeliveryLabel: UILabel!
    @IBOutlet weak var internationalPostLabel: UILabel!
    @IBOutlet weak var parcelForceLabel: UILabel!
    @IBOutlet weak var globalExpressLabel: UILabel!
    @IBOutlet weak var moneyGramLabel: UILabel!
    @IBOutlet weak var firstClassLabel: UILabel!
    @IBOutlet weak var secondClassLabel: UILabel!
    @IBOutlet weak var royalMailSignedForLabel: UILabel!
    @IBOutlet weak var travelMoneyCardLabel: UILabel!
    @IBOutlet weak var travelInsurancelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateReportLbl.text = dateReport
        specialDeliveryLabel.text = specialD
        internationalPostLabel.text = internationalP
        parcelForceLabel.text = parcelF
        globalExpressLabel.text = globalX
        moneyGramLabel.text = moneyG
        firstClassLabel.text = firstCL
        secondClassLabel.text = secondCl
        royalMailSignedForLabel.text = royalMSF
        travelMoneyCardLabel.text = tmc
        travelInsurancelabel.text = travelIns
        
    }
}
