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
    
    var testShopName = "TestName"
    var testShopAddress = "TestAddress"
    
    var mondayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var tuesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var wednesdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var thursdayWorkHours = Shop.WorkHours(from: "10:00", to: "21:00")
    var fridayWorkHours = Shop.WorkHours(from: "", to: "")
    var saturdayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    var sundayWorkHours = Shop.WorkHours(from: "09:00", to: "21:00")
    
    
    var arrayTextsForRow = [String]()
    
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
        testShop1 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop2 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        testShop3 = Shop(name: testShopName, address: testShopAddress, workSchedule: schedule)
        
        //  Initialize array with testShops:
        shops = [testShop, testShop1, testShop2, testShop3]
        
        arrayTextsForRow = ["Row1", "Row2", "Row3", "Row4"]
        
    }
    
    
    //    MARK: - TableView Methods:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return arrayTextsForRow.count
        //        return shops.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = arrayTextsForRow[row]
        return vw
    }
    
    
}
