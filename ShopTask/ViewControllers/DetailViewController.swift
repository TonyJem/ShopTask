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
    
    // MARK: - Properties
    var selectedShop: Shop!
    
    var mondayWorkHours0 = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours0 = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours0 = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours0 = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours0 = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours0 = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours0 = Shop.WorkHours(from: "09:00", to: "21:00")
    
    var columns: [NSTableColumn] = []
    
    var hoursAsStingInArray: [String] = []
    var registeredLeftItems: [Int] = []
    
    var hoursAsStingInArrayUpdated: [String] = hours
    
    var dayRanges: [String] = []
    
    var dayRangesRomanian: [String] = days
    
    //    MARK: - StartHere:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Create schedule for shop:
        let schedule0 = Shop.WorkSchedule(monday: mondayWorkHours0,
                                         tuesday: tuesdayWorkHours0,
                                         wednesday: wednesdayWorkHours0,
                                         thursday: thursdayWorkHours0,
                                         friday: nil,
                                         saturday: saturdayWorkHours0,
                                         sunday: sundayWorkHours0)
        
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
        selectedShop = Shop(name: "NoName", address: "NoShopAddress", workSchedule: schedule0)
        
        createNewTable()
    }
    
    //    MARK: - Methods:
    func shopSelected(shop: Shop) {
        shopNameLabel.stringValue = shop.name
        shopAddressLabel.stringValue = shop.address
        selectedShop = shop
        
        removeAllOldColumns()
        
        createNewTable()
    }
    
    func createNewTable(){
        createWorkingHoursArray()
        createResults()
        createRangeStrings()
        formatStringFiguresToRomanianStyle()
        
        // Create collumn instances and add them to table:
        for index in (0..<dayRangesRomanian.count){
            let column = NSTableColumn()
            column.title = dayRangesRomanian[index]
            columns.append(column)
            shopHoursTableView.addTableColumn(columns[index])
        }
        // Sizes the table view based on a uniform column autoresizing style:
        shopHoursTableView.sizeToFit()
    }
    
    
    func removeAllOldColumns(){
        for index in (0..<dayRangesRomanian.count){
            shopHoursTableView.removeTableColumn(columns[index])
        }
        columns.removeAll()
        shopHoursTableView.reloadData()
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
        var cellContent = ""
        
        switch tableColumn?.title {
        case dayRangesRomanian[0]:
            cellContent = hoursAsStingInArrayUpdated[0]
        case dayRangesRomanian[1]:
            cellContent = hoursAsStingInArrayUpdated[1]
        case dayRangesRomanian[2]:
            cellContent = hoursAsStingInArrayUpdated[2]
        case dayRangesRomanian[3]:
            cellContent = hoursAsStingInArrayUpdated[3]
        case dayRangesRomanian[4]:
            cellContent = hoursAsStingInArrayUpdated[4]
        case dayRangesRomanian[5]:
            cellContent = hoursAsStingInArrayUpdated[5]
        case dayRangesRomanian[6]:
            cellContent = hoursAsStingInArrayUpdated[6]
        default:
            cellContent = "default"
        }
        return NSTextField(labelWithString: cellContent)
    }
}

