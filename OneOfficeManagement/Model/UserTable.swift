//
//  UserTable.swift
//  OneOfficeManagement
//
//  Created by Attila I on 15/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class User: Object {
    
    dynamic var titleM: String = ""
    dynamic var firstName: String = ""
    dynamic var middleName: String? = nil
    dynamic var lastName: String = ""
    dynamic var email: String = ""
    dynamic var dateOfBirth: String = ""
    dynamic var telephone: String = ""
    dynamic var password: String = ""
    dynamic var address: String = ""
    dynamic var postcode: String = ""
    dynamic var city: String = ""
    dynamic var startDate: String = ""
    dynamic var endDate: String? = nil
   // dynamic var rolePosition: String = ""
    
    convenience init(titleM: String, firstName: String, middleName: String, lastName: String, email: String, dateOfBirth: String, telephone: String, password: String, address: String, postcode: String, startDate: String, endDate: String?) {
        
        self.init()
        self.titleM = titleM
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.telephone = telephone
        self.password = password
        self.address = address
        self.postcode = postcode
        self.city = city
        self.startDate = startDate
        self.endDate = endDate
      //  self.rolePosition = rolePosition
    }
    
    
    
    
}
