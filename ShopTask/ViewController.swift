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
            var rangeWithNumber = range
            
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "1", with: "I")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "2", with: "II")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "3", with: "III")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "4", with: "IV")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "5", with: "V")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "6", with: "VI")
            rangeWithNumber = findAndReplace(in: rangeWithNumber, number: "7", with: "VII")
            
            switch rangeWithNumber {
            case "I-I":
                rangeWithNumber = "I"
            case "II-II":
                rangeWithNumber = "II"
            case "III-III":
                rangeWithNumber = "III"
            case "IV-IV":
                rangeWithNumber = "IV"
            case "V-V":
                rangeWithNumber = "V"
            case "VI-VI":
                rangeWithNumber = "VI"
            case "VII-VII":
                rangeWithNumber = "VII"
            default: break
            }
            dayRangesRomanian.append(rangeWithNumber)
        }
    }
    
    func findAndReplace(in rangeAsString: String, number numberAsString: String, with symbol: String) -> String {
        let newStringWithReplacedSymbol = rangeAsString.replacingOccurrences(of: numberAsString, with: symbol)
        return newStringWithReplacedSymbol
    }
    
    
    
    //    MARK: - Actions
}
