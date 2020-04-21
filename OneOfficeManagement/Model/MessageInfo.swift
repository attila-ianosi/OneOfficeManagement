//
//  MessageInfo.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//


import Foundation
import RealmSwift

@objcMembers class Message: Object {
    
    dynamic var subjectInfo: String = ""
    dynamic var messageInfo: String = ""
    dynamic var dateOfMessage: String = ""
   
    
    convenience init(subjectInfo: String, messageInfo: String, dateOfMessage: String) {
        
        self.init()
        self.subjectInfo = subjectInfo
        self.messageInfo = messageInfo
        self.dateOfMessage = dateOfMessage
        
    }
    
}
