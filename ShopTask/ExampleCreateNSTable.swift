//
//  TableViewController.swift
//  NSTableViewProgrammatically
//
//  Created by Office-iMac on 2020-09-28.
//  Copyright © 2020 Tony Jem. All rights reserved.
//
// Main initial code idea from here:
//https://gist.github.com/kitx/a80bec25661b985118a55ca33ecfdff2

import Cocoa
//// MARK: - Data
//let days = ["I", "II", "III"]
//let hours = ["9:00 - 10:00", "11:00 - 12:00", "8:00 - 16:00"]

class ExampleTableViewController: NSViewController {
    // MARK: - Properties
    let scrollView = NSScrollView()
    
    let tableView: NSTableView = {
        let tableView = NSTableView()
        
        // A table view defaults to setting the intercell spacing (the gaps between columns and rows) to (3.0, 2.0)
        // To change it should be used:
        //    tableView.intercellSpacing = NSSize(width: 0, height: 2)
        
        // Normally a table has a header view.
        // To remove it use:
        //    tableView.headerView = nil
        return tableView
    }()
    
    var columns: [NSTableColumn] = []
    
    
    //    MARK: - Start here:
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        // Create collumn instances:
        let column0 = NSTableColumn()
        column0.width = 100
        column0.title = days[0]
        columns.append(column0)
        
        let column1 = NSTableColumn()
        column1.width = 200
        column1.title = days[1]
        columns.append(column1)
        
        let column2 = NSTableColumn()
        column2.width = 300
        column2.title = days[2]
        columns.append(column2)
        
        // Add collumn to table:
        tableView.addTableColumn(columns[0])
        tableView.addTableColumn(columns[1])
        tableView.addTableColumn(columns[2])
        
        // Tell the scroll view about the table view,
        // by setting the documentView to our table view:
        scrollView.documentView = tableView
    }
    
    // Loading a view controller without a NIB requires that we
    // override loadView and provide our own view instead
    
    override func loadView() {
        view = scrollView
    }
    
}


//// MARK: - Extentions
//extension TableViewController: NSTableViewDataSource {
//    func numberOfRows(in tableView: NSTableView) -> Int {
//        return 1
//    }
//}
//
//extension TableViewController: NSTableViewDelegate {
//    //    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
//    //        return 20
//    //    }
//
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//
//        var cellContant = ""
//        switch tableColumn?.title {
//        case "I":
//            cellContant = hours[0]
//        case "II":
//            cellContant = hours[1]
//        case "III":
//            cellContant = hours[2]
//        default:
//            cellContant = "default"
//        }
//
//        return NSTextField(labelWithString: cellContant)
//    }
//}
