//
//  Role.swift
//  OneOfficeManagement
//
//  Created by Attila I on 27/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import Foundation
import RealmSwift

class Role: Object{
   
    @objc dynamic var userType: String = ""
    let userRole = List<User>()
    
    convenience init (userType: String){
        self.init()
        self.userType = userType
        
    }

}
