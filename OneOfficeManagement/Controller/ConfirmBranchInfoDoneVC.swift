//
//  ConfirmationMessageCreatedVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmBranchInfoDoneVC: UIViewController {
    
    var finalMessage = ""

    @IBOutlet weak var confirmationLabelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmationLabelMessage.text = "\(finalMessage)"
        
    }

    @IBAction func seeBranchInfoMessages(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToBranchMessages", sender: self)
    }

    @IBAction func mainMenuBtn(_ sender: UIButton) {
          performSegue(withIdentifier: "goToBranchMessages", sender: self)
    }
    
}


