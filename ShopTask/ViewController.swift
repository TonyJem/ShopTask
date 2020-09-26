//
//  ViewController.swift
//  ShopTask
//
//  Created by Anton on 2020-09-26.
//

import Foundation
import Cocoa

class ViewController: NSViewController {
    //    MARK: Properties
    var testShop: Shop!
    
    var mondayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    
    //    MARK: - Start Here
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schedule = Shop.WorkSchedule(monday: mondayWorkHours,
                                         tuesday: tuesdayWorkHours,
                                         wednesday: wednesdayWorkHours,
                                         thursday: thursdayWorkHours,
                                         friday: nil,
                                         saturday: saturdayWorkHours,
                                         sunday: sundayWorkHours)
        
        testShop = Shop(name: "TestName", address: "TestAddress", workSchedule: schedule)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
        //    MARK: - Methods
        
    func getHoursInString(for hours: Shop.WorkHours?) -> String {
        var hoursInString = "Closed"
        if let dayHours = hours{
            hoursInString = "\(dayHours.from) - \(dayHours.to)"
        }
        return hoursInString
    }
    
    
}

