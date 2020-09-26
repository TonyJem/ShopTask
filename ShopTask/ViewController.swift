//
//  ViewController.swift
//  ShopTask
//
//  Created by Anton on 2020-09-26.
//

import Foundation
import Cocoa

class ViewController: NSViewController {

    var testShop: Shop!
    
    var mondayWorkHours = WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = WorkHours(from: "", to: "")
    var saturdayWorkHours = WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = WorkHours(from: "09:00", to: "21:00")
    
    var schedule: WorkSchedule!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mondayWorkHours)
        
        
        
        schedule = WorkSchedule(monday: mondayWorkHours, tuesday: tuesdayWorkHours, wednesday: wednesdayWorkHours, thursday: thursdayWorkHours, friday: fridayWorkHours, saturday: saturdayWorkHours, sunday: sundayWorkHours)
        if let mondayHours = schedule.monday{
            print(mondayHours)
        } else {
            print("closed")
        }
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

