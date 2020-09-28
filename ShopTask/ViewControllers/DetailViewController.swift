//
//  DetailViewController.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-26.
//

import Cocoa
// MARK: - Data
let days = ["I", "II", "III", "IV", "V", "VI", "VII"]
let hours = ["9:00 - 10:00", "11:00 - 12:00", "8:00 - 16:00", "9:00 - 10:00", "9:00 - 10:00","9:00 - 10:00","9:00 - 10:00"]

class DetailViewController: NSViewController {
    //    MARK: Outlets:
    //    @IBOutlet var ImageView: NSImageView!
    
    @IBOutlet var shopHoursTableView: NSTableView!
    @IBOutlet var shopNameLabel: NSTextField!
    @IBOutlet var shopAddressLabel: NSTextField!
    @IBOutlet var workingHoursStackView: NSStackView!
    @IBOutlet var workingHoursTableView: NSTableView!
    
    // MARK: - Properties
    var selectedShop: Shop!
    var columns: [NSTableColumn] = []
    
    var hoursAsStingInArray: [String] = []
    var registeredLeftItems: [Int] = []
    
    var hoursAsStingInArrayUpdated: [String] = []
    
    var dayRanges: [String] = []
    
    var dayRangesRomanian: [String] = []
    
    //    MARK: - StartHere:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
        
        // Create collumn instances and add them to table:
        for index in (0..<days.count){
            let column = NSTableColumn()
            column.title = days[index]
            columns.append(column)
            shopHoursTableView.addTableColumn(columns[index])
        }
        
        // Sizes the table view based on a uniform column autoresizing style:
        shopHoursTableView.sizeToFit()
    }
    
    //    MARK: - Methods:
    func shopSelected(shop: Shop) {
        shopNameLabel.stringValue = shop.name
        shopAddressLabel.stringValue = shop.address
        selectedShop = shop
        
        createWorkingHoursArray()
        createResults()
        createRangeStrings()
        formatStringFiguresToRomanianStyle()
    }
    
    func getHoursInString(for hours: Shop.WorkHours?) -> String {
        var hoursInString = "Closed"
        if let dayHours = hours{
            hoursInString = "\(dayHours.from) - \(dayHours.to)"
        }
        return hoursInString
    }
    
    func createWorkingHoursArray(){
        hoursAsStingInArray.removeAll()
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.monday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.tuesday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.wednesday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.thursday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.friday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.saturday))
        hoursAsStingInArray.append(getHoursInString(for: selectedShop.workSchedule.sunday))
    }
    
    func createResults(){
        registeredLeftItems.removeAll()
        registeredLeftItems.append(1)
        hoursAsStingInArrayUpdated.append(hoursAsStingInArray[0])
        for item in 1...6{
            if hoursAsStingInArray[item] == hoursAsStingInArray[item - 1]{
            } else {
                hoursAsStingInArrayUpdated.append(hoursAsStingInArray[item])
                registeredLeftItems.append(item + 1)
            }
        }
    }
    
    func createRangeStrings(){
        dayRanges.removeAll()
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
        dayRangesRomanian.removeAll()
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
}

// MARK: - Extentions
extension DetailViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 1
    }
}

extension DetailViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cellContant = ""
        switch tableColumn?.title {
        case days[0]:
            cellContant = hours[0]
        case days[1]:
            cellContant = hours[1]
        case days[2]:
            cellContant = hours[2]
        case days[3]:
            cellContant = hours[3]
        case days[4]:
            cellContant = hours[4]
        case days[5]:
            cellContant = hours[5]
        case days[6]:
            cellContant = hours[6]
        default:
            cellContant = "default"
        }
        return NSTextField(labelWithString: cellContant)
    }
}

