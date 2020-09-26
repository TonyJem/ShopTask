//
//  TableViewController.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-26.
//

import Cocoa

class TableViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    //    MARK: Outlets:
    @IBOutlet var tableView: NSTableView!
    
    
    
    //    MARK: - Properties:
    var testShop: Shop!
    var testShop1: Shop!
    var testShop2: Shop!
    var testShop3: Shop!
    
    var shops = [Shop]()
    
    var testShopName = "TestName0"
    var testShopAddress = "TestAddress"
    
    var mondayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    
    
    
    //    MARK: - StartHere:
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
        //  Initialize testShops:
        testShop = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop1 = Shop(name: "TestName1", address: "TestShopAddress1", workSchedule: schedule)
        testShop2 = Shop(name: "TestName2", address: "TestShopAddress2", workSchedule: schedule)
        testShop3 = Shop(name: "TestName3", address: "TestShopAddress3", workSchedule: schedule)
        
        //  Initialize array with testShops:
        shops = [testShop, testShop1, testShop2, testShop3]
        
        
    }
    
    
    //    MARK: - TableView Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return shops.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        switch tableColumn?.title {
        
        case "Name":
            vw.textField?.stringValue = shops[row].name
        case "Address":
            vw.textField?.stringValue = shops[row].address
        default:
            vw.textField?.stringValue = ""
        }
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.shopSelected(name: shops[tableView.selectedRow].name, address: shops[tableView.selectedRow].address)
        }
    }
    
    
}
