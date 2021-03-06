//
//  BranchFocusCell.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class BranchInfoCell: UITableViewCell {

    @IBOutlet weak var subjectTitle: UILabel!
    @IBOutlet weak var managerName: UILabel!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var contentMessage: UILabel!
    
    func updateNews(infoNews: BranchInfo ) {
        let currentDateTime = Date()
              let formatter = DateFormatter()
        formatter.dateStyle = .short
              let dateToString = formatter.string(from: currentDateTime)
        
        subjectTitle.text = infoNews.subject
        managerName.text = infoNews.manager
        dateLabel.text = dateToString
        contentMessage.text = infoNews.contentOfMessage
    }
}
