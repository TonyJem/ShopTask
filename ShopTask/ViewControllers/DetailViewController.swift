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
        workingHoursStackView.isHidden = true
        
        addNewCollumn()
    }
    
    //    MARK: - Methods:
    func shopSelected(name: String, address: String) {
        shopNameLabel.stringValue = name
        shopAddressLabel.stringValue = address
        workingHoursStackView.isHidden = false
    }
    
    //    MARK: - TableView Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        
        
        switch tableColumn?.title {
            
        case "1col":
            vw.textField?.stringValue = "1col"
        case "Field":
            vw.textField?.stringValue = "field"
        default:
            vw.textField?.stringValue = "Default"
            tableColumn?.title = "Change"
        }
        return vw
    }
    
    func addNewCollumn() {
        let col = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "col"))
        col.minWidth = 100
        
        workingHoursTableView.addTableColumn(col)
        
    }
    
    
    
    
    
}
