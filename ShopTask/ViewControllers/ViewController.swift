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
    var hoursAsStingInArrayUpdated: [String] = []
    var registeredLeftItems: [Int] = []
    var dayRanges: [String] = []
    var dayRangesRomanian: [String] = []
    
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
        testShop1 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop2 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop3 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        
        var shops: [Shop] =[testShop, testShop1, testShop2, testShop3]
        
        populateWorkingHoursArray()
        
        for (index, value) in hoursAsStingInArray.enumerated() {
            print("Day \(index + 1): \(value)")
        }
        
        createResults()
        
        print("------Updated Hours array:------")
        for (index, value) in hoursAsStingInArrayUpdated.enumerated() {
            print("Day \(index + 1): \(value)")
        }
        
        print("Days in list: \(registeredLeftItems)")
        
        
        createRangeStrings()
        print(dayRanges)
        
        formatStringFiguresToRomanianStyle()
        print(dayRangesRomanian)
        
        print(hoursAsStingInArrayUpdated)
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
        registeredLeftItems.append(1)
        hoursAsStingInArrayUpdated.append(hoursAsStingInArray[0])
        for item in 1...6{
            if hoursAsStingInArray[item] == hoursAsStingInArray[item - 1]{
                //                hoursAsStingInArrayUpdated.append("")
            } else {
                hoursAsStingInArrayUpdated.append(hoursAsStingInArray[item])
                registeredLeftItems.append(item + 1)
            }
        }
    }
    
    
    func createRangeStrings(){
        if registeredLeftItems.count > 1{
            for item in 0..<registeredLeftItems.count - 1 {
                if registeredLeftItems[item] == registeredLeftItems[item + 1] - 1{
                    dayRanges.append("\(registeredLeftItems[item])-\(registeredLeftItems[item])")
                } else {
                    dayRanges.append("\(registeredLeftItems[item])-\(registeredLeftItems[item + 1] - 1)")
                }
            }
        }
        dayRanges.append("\(registeredLeftItems[registeredLeftItems.count - 1])-7")
    }
    
    func formatStringFiguresToRomanianStyle(){
        for range in dayRanges{
            var rangeToRomanian = range
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "1", with: "I")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "2", with: "II")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "3", with: "III")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "4", with: "IV")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "5", with: "V")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "6", with: "VI")
            rangeToRomanian = rangeToRomanian.replacingOccurrences(of: "7", with: "VII")
            
            switch rangeToRomanian {
            case "I-I":
                rangeToRomanian = "I"
            case "II-II":
                rangeToRomanian = "II"
            case "III-III":
                rangeToRomanian = "III"
            case "IV-IV":
                rangeToRomanian = "IV"
            case "V-V":
                rangeToRomanian = "V"
            case "VI-VI":
                rangeToRomanian = "VI"
            case "VII-VII":
                rangeToRomanian = "VII"
            default: break
            }
            
            dayRangesRomanian.append(rangeToRomanian)
        }
    }
    
    
    
    
    
    //    MARK: - Actions
}
