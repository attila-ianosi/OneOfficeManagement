//
//  HolidayBookingVC.swift
//  OneOfficeManagement
//
//  Created by Attila I on 18/03/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift
    //MARK: Holiday class with the Delegates
class HolidayBookingVC: UIViewController, FSCalendarDelegate, UITextFieldDelegate,
                        UITextViewDelegate {
    //MARK: Dates variables
    var selectedLeaveDate = ""
    var selectedReturnDate = ""
    private var datePicker: UIDatePicker?
    //MARK: Holidays Array Declaration
    var holidays: Results<Holiday>!
    //MARK: Holiday Booking Outlets
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet weak var leaveDateHoliday: UITextField!
    @IBOutlet weak var returnDateHoliday: UITextField!
    @IBOutlet weak var extraNotesforHoliday: UITextView!
    @IBOutlet weak var employeeName: UITextField!
    //MARK: Configure Holidays
    func configure(with holidays: Holiday){
        leaveDateHoliday.text = holidays.leaveDateHoliday
        returnDateHoliday.text = holidays.returnDateHoliday
        extraNotesforHoliday.text = holidays.extraNotesHoliday
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //MARK: Calendar initialization delegate
        calendar.delegate = self
        
        //MARK: Delegate for UITextfield and textView
              self.leaveDateHoliday.delegate = self
              self.returnDateHoliday.delegate = self
              self.extraNotesforHoliday.delegate = self
              self.employeeName.delegate = self
              //MARK: The Realm Datase Access
              let realm = RealmService.shared.realm
              holidays = realm.objects(Holiday.self)
        //MARK: Date Picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action:
            #selector(ReportSalesVC.dateChanged(datePicker:)), for: .valueChanged)
        returnDateHoliday.inputView = datePicker
    }
    
    //MARK: Function that helps the Date Picker
     @objc func dateChanged(datePicker: UIDatePicker) {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd.MM.yyyy"
         returnDateHoliday.text = dateFormatter.string(from: datePicker.date)
     }
    
    @IBAction func submitHolidayPressed(_ sender: UIButton) {
        //MARK: Conditional Statements for Date Validation
        if leaveDateHoliday.text == "" || returnDateHoliday.text == "" ||
            employeeName.text == "" || extraNotesforHoliday.text == "" {
            createAlert(title: "ALERT", message: "There are missing fields")
        } else {
            let newHoliday = Holiday(leaveDateHoliday: leaveDateHoliday.text!,
                                     returnDateHoliday: returnDateHoliday.text!,
                                     extraNotesHoliday: extraNotesforHoliday.text!,
                                     employeeName: employeeName.text!)
                 //MARK: New Holiday Booking object created
                RealmService.shared.create(newHoliday)
               //MARK: Variables to be passed
                selectedLeaveDate = leaveDateHoliday.text!
                selectedReturnDate = returnDateHoliday.text!
            performSegue(withIdentifier: "goToHolidayRequestConfirmation", sender: self)
        }
    }
    //MARK: Prepare function for variable passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HolidayConfirmationVC
        vc.leaveDateSelected = self.selectedLeaveDate
        vc.returnDateSelected = self.selectedReturnDate
    }
    //MARK: Select a date function
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition:
        FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        let datePicked = formatter.string(from: date)
        
        leaveDateHoliday.text = datePicked
    }
    
    //MARK: Hides Keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: Hide Keyboard when user touches RETURN key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    //MARK: The alert function
    func createAlert(title: String, message: String){
          let alert = UIAlertController(title: title, message: message,
                                        preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "Dismiss",
                                        style: UIAlertAction.Style.default, handler: { (action) in
              alert.dismiss(animated: true, completion: nil)
          }))
          self.present(alert, animated: true, completion: nil)
      }
}
