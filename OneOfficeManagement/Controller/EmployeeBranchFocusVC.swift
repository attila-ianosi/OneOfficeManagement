//
//  EmployeeBranchFocusVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class EmployeeBranchFocusVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var branchFocusTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        branchFocusTableView.dataSource = self
        branchFocusTableView.delegate = self

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataService.instance.getBranchNews().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BranchInfoCell") as? BranchInfoCell{
            let branchNews = DataService.instance.getBranchNews()[indexPath.row]
            cell.updateNews(infoNews: branchNews)
            
            return cell
        } else {
            return BranchInfoCell()
        }
        
    }
    



}
