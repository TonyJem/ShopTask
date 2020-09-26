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
    
    var mondayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    
    var schedule: Shop.WorkSchedule!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mondayWorkHours)
        
        schedule = Shop.WorkSchedule(monday: mondayWorkHours,
                                     tuesday: tuesdayWorkHours,
                                     wednesday: wednesdayWorkHours,
                                     thursday: thursdayWorkHours,
                                     friday: fridayWorkHours,
                                     saturday: saturdayWorkHours,
                                     sunday: sundayWorkHours)
        if let mondayHours = schedule.monday{
            print(mondayHours)
        } else {
            print("closed")
        }
        
        //         Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

