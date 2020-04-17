//
//  ConfirmationMessageCreatedVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class ConfirmationMessageCreatedVC: UIViewController {
    
    var finalMessage = ""

    @IBOutlet weak var confirmationLabelMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        confirmationLabelMessage.text = " Branch Info with the subject \(finalMessage) has been posted"
        
        
    }
    

    @IBAction func seeBranchInfoMessages(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToBranchMessages", sender: self)
    }


}


