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
    var columns: [NSTableColumn] = []
    
    
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
    func shopSelected(name: String, address: String) {
        shopNameLabel.stringValue = name
        shopAddressLabel.stringValue = address
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

