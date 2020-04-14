//
//  BranchInfo.swift
//  OneOfficeManagement
//
//  Created by Attila I on 14/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import Foundation

struct BranchInfo {
    
    private(set) public var subject: String
    private(set) public var manager: String
    private(set) public var infoDate: String
    
    init(subject: String, manager: String, infoDate: String) {
        self.subject = subject
        self.manager = manager
        self.infoDate = infoDate
        
    }
}
