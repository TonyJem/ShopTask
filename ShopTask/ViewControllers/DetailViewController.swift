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
    
    // MARK: - Properties:
    var selectedShop: Shop!
    
    //  Array containing all tables collumns as NSTableColumns
    var columns: [NSTableColumn] = []
    
    //  Array with All workingHours as Strings
    var hoursAsStingInArray: [String] = []
    
    //  Array with unique workingHours day's numbers as Ints
    var registeredLeftItems: [Int] = []
    
    //  Array with only unique workingHours as Ints
    var hoursAsStringInArrayUpdated: [String] = []
    
    //  Array with collumn titles as Arab numerals
    var dayRanges: [String] = []
    
    //  Array with collumn titles as Roman numerals
    var dayRangesRomanian: [String] = []
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
    }
    
    //    MARK: - Methods:
    func showSelectedShopDetails(for shop: Shop) {
        shopNameLabel.stringValue = shop.name
        shopAddressLabel.stringValue = shop.address
        selectedShop = shop
        
        removeAllOldColumnsAndData()
        
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
    
    // Reset arrays, containing table collumns and table data, to initial state:
    func removeAllOldColumnsAndData(){
        if dayRangesRomanian.count != 0 {
            for index in (0..<dayRangesRomanian.count){
                shopHoursTableView.removeTableColumn(columns[index])
            }
        }
        
        columns.removeAll()
        hoursAsStringInArrayUpdated = []
        dayRangesRomanian = []
        shopHoursTableView.reloadData()
    }
    
    // Convert workingHours to String type:
    func getHoursInString(for hours: Shop.WorkHours?) -> String {
        var hoursInString = "Closed"
        if let dayHours = hours{
            hoursInString = "\(dayHours.from) - \(dayHours.to)"
        }
        return hoursInString
    }
    
    // Create Array containing workingHours as Strings:
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
    
    // Create two Arrays, one containing only unique workingHours as Strings and other that holds days' (with unique workingHours) numbers as Int:
    func createResults(){
        registeredLeftItems.removeAll()
        registeredLeftItems.append(1)
        hoursAsStringInArrayUpdated.append(hoursAsStingInArray[0])
        for item in 1...6{
            if hoursAsStingInArray[item] == hoursAsStingInArray[item - 1]{
            } else {
                hoursAsStringInArrayUpdated.append(hoursAsStingInArray[item])
                registeredLeftItems.append(item + 1)
            }
        }
    }
    
    // Create Array containing collumns' titles as Ints:
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
    
    // Create Array containing formatted to Roman numerals collumns' titles as Ints:
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
        case dayRangesRomanian[0]:
            cellContent = hoursAsStringInArrayUpdated[0]
        case dayRangesRomanian[1]:
            cellContent = hoursAsStringInArrayUpdated[1]
        case dayRangesRomanian[2]:
            cellContent = hoursAsStringInArrayUpdated[2]
        case dayRangesRomanian[3]:
            cellContent = hoursAsStringInArrayUpdated[3]
        case dayRangesRomanian[4]:
            cellContent = hoursAsStringInArrayUpdated[4]
        case dayRangesRomanian[5]:
            cellContent = hoursAsStringInArrayUpdated[5]
        case dayRangesRomanian[6]:
            cellContent = hoursAsStringInArrayUpdated[6]
        default:
            cellContent = "default"
        }
        return NSTextField(labelWithString: cellContent)
    }
}
