//
//  ConfirmationMessageCreatedVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmBranchInfoVC: UIViewController {
    
    var finalMessage = ""

    @IBOutlet weak var confirmationLabelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //MARK: Label Declaration
        confirmationLabelMessage.text = "\(finalMessage)"
    }
    //MARK: See Branch Info Button
    @IBAction func seeBranchInfoMessages(_ sender: UIButton) {
        performSegue(withIdentifier: "goToBranchMessages", sender: self)
    }
    //MARK: Main Menu Button
    @IBAction func mainMenuBtn(_ sender: UIButton) {
          performSegue(withIdentifier: "goToBranchMessages", sender: self)
    }
}


