//
//  HolidayBookingVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 18/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class HolidayBookingVC: UIViewController, FSCalendarDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var holidays: Results<Holiday>!
    
    @IBOutlet var calendar: FSCalendar!

    @IBOutlet weak var leaveDateHoliday: UITextField!
    
    @IBOutlet weak var returnDateHoliday: UITextField!
    
    @IBOutlet weak var extraNotesforHoliday: UITextView!
    
    func configure(with holidays: Holiday){
        
        leaveDateHoliday.text = holidays.leaveDateHoliday
        returnDateHoliday.text = holidays.returnDateHoliday
        extraNotesforHoliday.text = holidays.extraNotesHoliday
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Calendar initializa delegate
        calendar.delegate = self
        //Delegate for UITextfield and textView
              self.leaveDateHoliday.delegate = self
              self.returnDateHoliday.delegate = self
              self.extraNotesforHoliday.delegate = self
              
            //  print(Realm.Configuration.defaultConfiguration.fileURL!)
              let realm = RealmService.shared.realm
              holidays = realm.objects(Holiday.self)
        
    }
    
    @IBAction func submitHolidayPressed(_ sender: UIButton) {
        let newHoliday = Holiday(leaveDateHoliday: leaveDateHoliday.text!, returnDateHoliday: returnDateHoliday.text!, extraNotesHoliday: extraNotesforHoliday.text!)
               
               RealmService.shared.create(newHoliday)
        
    }
    //Select a date function
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let datePicked = formatter.string(from: date)
        print("\(datePicked)")
        
    }


}
