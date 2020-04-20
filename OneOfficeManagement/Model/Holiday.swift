//
//  Holiday.swift
//  OneOfficeManagement
//
//  Created by Attila I on 18/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Holiday: Object {
    
    dynamic var leaveDateHoliday: String = ""
    dynamic var returnDateHoliday: String = ""
    dynamic var extraNotesHoliday: String = ""
    
   
    
    convenience init(leaveDateHoliday: String, returnDateHoliday: String, extraNotesHoliday: String) {
        
        self.init()
        self.leaveDateHoliday = leaveDateHoliday
        self.returnDateHoliday = returnDateHoliday
        self.extraNotesHoliday = extraNotesHoliday
    
        
    }
    
}
