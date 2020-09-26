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
     
    
    
    
    
//    var testWorkSchedule = Shop(name: "ShopName", address: "ShopAddress", workSchedule: shedule)
    
//    var testWorkSchedule = Shop.workSchedule(monday: mondayWorkHours, tuesday: tuesdayWorkHours, wednesday: wednesdayWorkHours, thursday: thursdayWorkHours, friday: fridayWorkHours, saturday: saturdayWorkHours, sunday: sundayWorkHours)
    
//    var myTestShop: Shop = Shop(name: <#T##String#>, address: <#T##String#>, workSchedule: <#T##Shop.workSchedule#>)
    
    
    var myWorkHours = WorkHours(from: "9:00", to: "10:00")

    var mySchedule = WorkSchedule()

    var myShop = Shop(name: "ShopName", address: "Vilnius", workSchedule: mySchedule)
//    Cia Gaunu klaida: Cannot use instance member 'mySchedule' within property initializer; property initializers run before 'self' is available
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

