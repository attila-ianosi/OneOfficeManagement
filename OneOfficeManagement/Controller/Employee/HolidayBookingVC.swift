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
    
    var selectedLeaveDate = ""
    var selectedReturnDate = ""
    
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
        
         selectedLeaveDate = leaveDateHoliday.text!
        selectedReturnDate = returnDateHoliday.text!
        
       performSegue(withIdentifier: "goToHolidayRequestConfirmation", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HolidayConfirmationVC
        vc.leaveDateSelected = self.selectedLeaveDate
        vc.returnDateSelected = self.selectedReturnDate
    }
    
    
    
    //Select a date function
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        let datePicked = formatter.string(from: date)
        
        leaveDateHoliday.text = datePicked
    }
    
    //Hides Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //Hide Keyboard when user touches RETURN key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }


}
