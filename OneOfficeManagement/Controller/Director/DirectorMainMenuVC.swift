//
//  EmployeeMainMenuVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class DirectorMainMenuVC: UIViewController {

    @IBOutlet weak var branchFocusBtn: UIButton!
    
    @IBOutlet weak var salesHistoryBtn: UIButton!
    
    @IBOutlet weak var createUsertBtn: UIButton!
    
    @IBOutlet weak var userListBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        branchFocusBtn.layer.cornerRadius = 21
        salesHistoryBtn.layer.cornerRadius = 21
        createUsertBtn.layer.cornerRadius = 21
        userListBtn.layer.cornerRadius = 21
       
    }
    
    @IBAction func branchFocusBtnPressed(_ sender: UIButton) {
         
        self.performSegue(withIdentifier: "goToBranchFocusDirector", sender: self)
    }
    
    @IBAction func salesHistoryBtnPressed(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func createUsertBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSelectRole", sender: self)
        
    }
    
    @IBAction func userListBtnPressed(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "goToUserList", sender: self)
    }
    
}
