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
        return 2
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        switch tableColumn?.title {
            
        case "1":
            vw.textField?.stringValue = "20:00 - 22:00"
        case "2":
            vw.textField?.stringValue = "9:00 - 10:00"
        case "3":
            vw.textField?.stringValue = "9:00 - 10:00"
        case "4":
            vw.textField?.stringValue = "9:00 - 10:00"
        case "5":
            vw.textField?.stringValue = "9:00 - 10:00"
        case "6":
            vw.textField?.stringValue = "9:00 - 10:00"
        case "7":
            vw.textField?.stringValue = "9:00 - 10:00"
        default:
            vw.textField?.stringValue = "N/A"
        }
        return vw
    }
    
}
