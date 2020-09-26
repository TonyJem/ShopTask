//
//  ViewController.swift
//  ShopTask
//
//  Created by Anton on 2020-09-26.
//

import Foundation
import Cocoa

class ViewController: NSViewController {
    //    MARK: - Outlets
    
    //    MARK: - Properties
    var testShop: Shop!
    
    var testShopName = "TestName"
    var testShopAddress = "TestAddress"
    
    var mondayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    
    var hoursAsStingInArray: [String] = []
    let daysAsStingInArray: [String] = ["I","II","III","IV","V","VI","VII"]
    
    var daysToShow: [String] = []
    var hoursToShow: [String] = []
    
    //    MARK: - Start Here
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Create schedule for shop:
        let schedule = Shop.WorkSchedule(monday: mondayWorkHours,
                                         tuesday: tuesdayWorkHours,
                                         wednesday: wednesdayWorkHours,
                                         thursday: thursdayWorkHours,
                                         friday: nil,
                                         saturday: saturdayWorkHours,
                                         sunday: sundayWorkHours)
        //  Initialize testShop:
        testShop = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        
        populateWorkingHoursArray()
        
        createResults()
        print(hoursToShow)
        print(daysToShow)
        
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
    
    func populateWorkingHoursArray(){
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.monday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.tuesday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.wednesday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.thursday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.friday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.saturday))
        hoursAsStingInArray.append(getHoursInString(for: testShop.workSchedule.sunday))
    }
    
    func createResults(){
        daysToShow.removeAll()
        hoursToShow.removeAll()
        
        hoursToShow.append(hoursAsStingInArray[0])
        daysToShow.append(daysAsStingInArray[0])
        
        for item in (1...6) {
            if hoursAsStingInArray[item] != hoursAsStingInArray[item - 1] {
                hoursToShow.append(hoursAsStingInArray[item])
                daysToShow.append(daysAsStingInArray[item])
            }
        }
    }
    
    
    
    //    MARK: - Actions
}

