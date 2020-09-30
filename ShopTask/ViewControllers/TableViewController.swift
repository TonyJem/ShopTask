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
    
    var mondayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var fridayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var saturdayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours1 = Shop.WorkHours(from: "09:00", to: "21:00")
    
    var mondayWorkHours2 = Shop.WorkHours(from: "10:00", to: "20:00")
    var tuesdayWorkHours2 = Shop.WorkHours(from: "10:00", to: "20:00")
    var wednesdayWorkHours2 = Shop.WorkHours(from: "10:00", to: "20:00")
    var thursdayWorkHours2 = Shop.WorkHours(from: "10:00", to: "20:00")
    var fridayWorkHours2 = Shop.WorkHours(from: "10:00", to: "20:00")
    var saturdayWorkHours2 = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours2 = Shop.WorkHours(from: "09:00", to: "21:00")
    
    var mondayWorkHours3 = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours3 = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours3 = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours3 = Shop.WorkHours(from: "", to: "")
    var fridayWorkHours3 = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours3 = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours3 = Shop.WorkHours(from: "09:00", to: "21:00")
    
    
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  Create schedule for shop:
        let schedule = Shop.WorkSchedule(monday: nil,
                                         tuesday: nil,
                                         wednesday: nil,
                                         thursday: nil,
                                         friday: nil,
                                         saturday: nil,
                                         sunday: nil)
        
        let schedule1 = Shop.WorkSchedule(monday: mondayWorkHours1,
                                         tuesday: tuesdayWorkHours1,
                                         wednesday: wednesdayWorkHours1,
                                         thursday: thursdayWorkHours1,
                                         friday: fridayWorkHours1,
                                         saturday: saturdayWorkHours1,
                                         sunday: sundayWorkHours1)
        
        
        let schedule2 = Shop.WorkSchedule(monday: mondayWorkHours2,
                                         tuesday: tuesdayWorkHours2,
                                         wednesday: wednesdayWorkHours2,
                                         thursday: thursdayWorkHours2,
                                         friday: nil,
                                         saturday: nil,
                                         sunday: nil)
        
        let schedule3 = Shop.WorkSchedule(monday: mondayWorkHours3,
                                         tuesday: tuesdayWorkHours3,
                                         wednesday: wednesdayWorkHours3,
                                         thursday: nil,
                                         friday: nil,
                                         saturday: saturdayWorkHours3,
                                         sunday: sundayWorkHours3)
        
        //  Initialize testShops:
        testShop = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop1 = Shop(name: "TestName1", address: "TestShopAddress1", workSchedule: schedule1)
        testShop2 = Shop(name: "TestName2", address: "TestShopAddress2", workSchedule: schedule2)
        testShop3 = Shop(name: "TestName3", address: "TestShopAddress3", workSchedule: schedule3)
        
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
            detail.shopSelected(shop: shops[tableView.selectedRow])
        }
    }
    
    
}
