//
//  SalesReportFigures.swift
//  OneOfficeManagement
//
//  Created by Attila I on 17/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Figure: Object {
    
    dynamic var reportDate: String = ""
    dynamic var specialDelivery: String = ""
    dynamic var internationalPost: String = ""
    dynamic var parcelForce: String = ""
    dynamic var globalExpress: String = ""
    dynamic var moneyGram: String = ""
    dynamic var firstClass: String = ""
    dynamic var secondClass: String = ""
    dynamic var royalMailSignedFor: String = ""
    dynamic var travelMoneyCard: String = ""
   
    dynamic var travelInsurance: String = ""
   
    
    convenience init(reportDate: String, specialDelivery: String, internationalPost: String, parcelForce: String, globalExpress: String, moneyGram: String, firstClass: String, secondClass: String, royalMailSignedFor: String, travelMoneyCard: String, travelInsurance: String) {
        
        self.init()
        self.reportDate = reportDate
        self.specialDelivery = specialDelivery
        self.internationalPost = internationalPost
        self.parcelForce = parcelForce
        self.globalExpress = globalExpress
        self.moneyGram = moneyGram
        self.firstClass = firstClass
        self.secondClass = secondClass
        self.royalMailSignedFor = royalMailSignedFor
        self.travelMoneyCard = travelMoneyCard
        self.travelInsurance = travelInsurance
        
       
    }
    
    
    
    
}
