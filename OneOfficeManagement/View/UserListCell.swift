//
//  userListCell.swift
//  OneOfficeManagement
//
//  Created by Attila I on 16/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import RealmSwift

class UserListCell: UITableViewCell {

 @IBOutlet weak var userNameInCell: UILabel!

    func updateUser(user: User){
        userNameInCell.text = user.firstName
        
    }
    
    
}
