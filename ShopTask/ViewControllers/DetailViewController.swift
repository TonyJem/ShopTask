//
//  DetailViewController.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-26.
//

import Cocoa

class DetailViewController: NSViewController {
    //    MARK: Outlets:
    @IBOutlet var shopHoursTableView: NSTableView!
    @IBOutlet var shopNameLabel: NSTextField!
    @IBOutlet var shopAddressLabel: NSTextField!
    @IBOutlet var workingHoursStackView: NSStackView!
    @IBOutlet var editShopDetailsBtn: NSButton!
    
    // MARK: - Properties:
    var selectedShop: Shop!
    
    //  Array containing all tables columns as NSTableColumns
    var tableColumns: [NSTableColumn] = []
    
    //  Array with All workingHours as Strings
    var allShopHours: [String] = []
    
    //  Array with only unique workingHours as Strings
    var uniqueShopHours: [String] = []
    
    //  Array with unique workingHours day's numbers as Ints
    var uniqueShopDays: [Int] = []
    
    //  Array with column titles as Arab numerals
    var dayRanges: [String] = []
    
    //  Array with column titles as Roman numerals
    var columnTitles: [String] = []
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
        
        editShopDetailsBtn.isEnabled = false
    }
    
    //    MARK: - Methods:
    func showDetails(for shop: Shop) {
        shopNameLabel.stringValue = shop.name
        shopAddressLabel.stringValue = shop.address
        selectedShop = shop
        
        editShopDetailsBtn.isEnabled = true
        
        resetDataAndTableColumns()
        fillTableWithSelectedShopDetails()
    }
    
    func fillTableWithSelectedShopDetails(){
        createallShopHours()
        createuniqueShopHoursAndUniqueDays()
        createDayRanges()
        turnDayRangesToRoman()
        
        // Create column instances and add them to table:
        for index in (0..<columnTitles.count){
            let column = NSTableColumn()
            column.title = columnTitles[index]
            tableColumns.append(column)
            shopHoursTableView.addTableColumn(tableColumns[index])
        }
        // Sizes the table view based on a uniform column autoresizing style:
        shopHoursTableView.sizeToFit()
    }
    
    // Reset arrays, containing table columns and table data, to initial state:
    func resetDataAndTableColumns(){
        if columnTitles.count != 0 {
            for index in (0..<columnTitles.count){
                shopHoursTableView.removeTableColumn(tableColumns[index])
            }
        }
        
        tableColumns.removeAll()
        uniqueShopHours = []
        columnTitles = []
        shopHoursTableView.reloadData()
    }
    
    // Convert workingHours to String type:
    func getString(for hours: Shop.WorkHours?) -> String {
        var hoursInString = "Closed"
        if let dayHours = hours{
            hoursInString = "\(dayHours.from) - \(dayHours.to)"
        }
        return hoursInString
    }
    
    // Create Array containing workingHours as Strings:
    func createallShopHours(){
        allShopHours.removeAll()
        allShopHours.append(getString(for: selectedShop.workSchedule.monday))
        allShopHours.append(getString(for: selectedShop.workSchedule.tuesday))
        allShopHours.append(getString(for: selectedShop.workSchedule.wednesday))
        allShopHours.append(getString(for: selectedShop.workSchedule.thursday))
        allShopHours.append(getString(for: selectedShop.workSchedule.friday))
        allShopHours.append(getString(for: selectedShop.workSchedule.saturday))
        allShopHours.append(getString(for: selectedShop.workSchedule.sunday))
    }
    
    // Create two Arrays, one containing only unique workingHours as Strings and other that holds days' (with unique workingHours) numbers as Int:
    func createuniqueShopHoursAndUniqueDays(){
        uniqueShopDays.removeAll()
        uniqueShopDays.append(1)
        uniqueShopHours.append(allShopHours[0])
        for index in 1...6{
            if allShopHours[index] == allShopHours[index - 1]{
            } else {
                uniqueShopHours.append(allShopHours[index])
                uniqueShopDays.append(index + 1)
            }
        }
    }
    
    // Create Array containing columns' titles as Ints:
    func createDayRanges(){
        dayRanges.removeAll()
        if uniqueShopDays.count > 1{
            for index in 0..<uniqueShopDays.count - 1 {
                if uniqueShopDays[index] == uniqueShopDays[index + 1] - 1{
                    dayRanges.append("\(uniqueShopDays[index])-\(uniqueShopDays[index])")
                } else {
                    dayRanges.append("\(uniqueShopDays[index])-\(uniqueShopDays[index + 1] - 1)")
                }
            }
        }
        dayRanges.append("\(uniqueShopDays[uniqueShopDays.count - 1])-7")
    }
    
    // Create Array containing formatted to Roman numerals columns' titles as Ints:
    func turnDayRangesToRoman(){
        columnTitles.removeAll()
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
            columnTitles.append(rangeToRomanian)
        }
    }
}

// MARK: - Extentions for managing TableView:
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
        case columnTitles[0]:
            cellContent = uniqueShopHours[0]
        case columnTitles[1]:
            cellContent = uniqueShopHours[1]
        case columnTitles[2]:
            cellContent = uniqueShopHours[2]
        case columnTitles[3]:
            cellContent = uniqueShopHours[3]
        case columnTitles[4]:
            cellContent = uniqueShopHours[4]
        case columnTitles[5]:
            cellContent = uniqueShopHours[5]
        case columnTitles[6]:
            cellContent = uniqueShopHours[6]
        default:
            cellContent = "default"
        }
        return NSTextField(labelWithString: cellContent)
    }
}
