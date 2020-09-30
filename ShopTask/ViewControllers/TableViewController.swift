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
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Initialize testShops:
        testShop = Shop(name: "TestName0", address: "TestShopAddress0", workSchedule: schedule0)
        testShop1 = Shop(name: "TestName1", address: "TestShopAddress1", workSchedule: schedule1)
        testShop2 = Shop(name: "TestName2", address: "TestShopAddress2", workSchedule: schedule2)
        testShop3 = Shop(name: "TestName3", address: "TestShopAddress3", workSchedule: schedule3)
        
        //  Initialize array with testShops:
        shops = [testShop, testShop1, testShop2, testShop3]
    }
    
    //    MARK: - TableView Methods:
    
    // Returns the number of records (rows) managed for a TableView:
    func numberOfRows(in tableView: NSTableView) -> Int {
        return shops.count
    }
    
    // Fill TabelView's each row's collumn accordingly to that collumn title's name:
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
    
    // Provide data from selected row to DetailViewController:
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        if let detailVC = splitVC.children[1] as? DetailViewController {
            detailVC.shopSelected(shop: shops[tableView.selectedRow])
        }
    }
}
