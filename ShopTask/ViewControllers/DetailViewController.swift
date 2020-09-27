//
//  DetailViewController.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-26.
//

import Cocoa

class DetailViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    //    MARK: Outlets:
    //    @IBOutlet var ImageView: NSImageView!
    
    @IBOutlet var shopNameLabel: NSTextField!
    @IBOutlet var shopAddressLabel: NSTextField!
    @IBOutlet var workingHoursStackView: NSStackView!
    @IBOutlet var workingHoursTableView: NSTableView!
    
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
//        workingHoursStackView.isHidden = true
    }
    
    //    MARK: - Methods:
    func shopSelected(name: String, address: String) {
        
        shopNameLabel.stringValue = name
        shopAddressLabel.stringValue = address
//        workingHoursStackView.isHidden = false
        
        workingHoursTableView.reloadData()
    }
    
    //    MARK: - TableView Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        switch tableColumn?.title {
            
        case "col2":
            vw.textField?.stringValue = "col2"
        case "I":
            vw.textField?.stringValue = "9:00 - 10:00"
        default:
            vw.textField?.stringValue = "Default"
        }
        return vw
    }
    
    func addNewColumn() {
        let newColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "collumnID"))
        newColumn.minWidth = 100
        newColumn.title = "col2"
        print(newColumn.identifier)
        workingHoursTableView.addTableColumn(newColumn)
        
    }
    
    
    
    
    
}
