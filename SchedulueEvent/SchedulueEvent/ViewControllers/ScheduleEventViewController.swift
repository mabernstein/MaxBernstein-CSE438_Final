//
//  ScheduleEventViewController.swift
//  SchedulueEvent
//
//  Created by Max Bernstein on 11/19/18.
//  Copyright © 2018 Max Bernstein. All rights reserved.
//

import UIKit

class ScheduleEventViewController: UIViewController {
    
    var diffInDays = 0
    var eventDays: [Date] = []
    
    private var startDatePicker: UIDatePicker?
    private var endDatePicker: UIDatePicker?

    
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!

    @IBAction func createEvent(_ sender: Any) {
        if let start = startDatePicker?.date {
            if let end = endDatePicker?.date {
                
                diffInDays = Calendar.current.dateComponents([Calendar.Component.day], from: start, to: end).day!
                print(diffInDays)
                
                eventDays = start.allDates(till: end)
                print(eventDays)
                
            }
        }
        
        let ScheduleVC = ScheduleViewController()
        ScheduleVC.startDay = startDatePicker?.date
        ScheduleVC.endDay = endDatePicker?.date
        ScheduleVC.numberOfDays = diffInDays
        
        navigationController?.pushViewController(ScheduleVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
//        configureTapGesture()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func configureTextFields() {
        startDatePicker = UIDatePicker()
        startDatePicker?.datePickerMode = .dateAndTime
        startDatePicker?.minuteInterval = 15
        startDatePicker?.addTarget(self, action: #selector(ScheduleEventViewController.startDateChanged(startDatePicker:)), for: .valueChanged)
        startDate.inputView = startDatePicker
        
        endDatePicker = UIDatePicker()
        endDatePicker?.datePickerMode = .dateAndTime
        endDatePicker?.minuteInterval = 30
        endDatePicker?.addTarget(self, action: #selector(ScheduleEventViewController.endDateChanged(endDatePicker:)), for: .valueChanged)
        endDate.inputView = endDatePicker
        
        
        let startTapGesture = UITapGestureRecognizer(target: self, action: #selector(ScheduleEventViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(startTapGesture)
        

    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func startDateChanged(startDatePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        startDate.text = dateFormatter.string(from: startDatePicker.date)
        
    }
    @objc func endDateChanged(endDatePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        endDate.text = dateFormatter.string(from: endDatePicker.date)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let start = startDatePicker?.date {
            if let end = endDatePicker?.date {
                
                diffInDays = Calendar.current.dateComponents([Calendar.Component.day], from: start, to: end).day!
                print(diffInDays)
                
                eventDays = start.allDates(till: end)
                print(eventDays)
                
            }
        }
        
        let ScheduleVC: ScheduleViewController = segue.destination as! ScheduleViewController
        
        ScheduleVC.startDay = startDatePicker?.date
        ScheduleVC.endDay = endDatePicker?.date
        ScheduleVC.numberOfDays = diffInDays
    
    }
    
}




extension Date {
    
    func allDates(till endDate: Date) -> [Date] {
        var date = self
        var array: [Date] = []
        
        while date <= endDate {
            array.append(date)
            date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        }
        return array
    }
}








