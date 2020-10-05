//
//  ViewController.swift
//  ShopTask
//
//  Created by Anton on 2020-09-26.
//

import Foundation
import Cocoa

class EditDetailsViewController: NSViewController {
    //    MARK: - Outlets
    @IBOutlet var shopNameTextField: NSTextField!
    @IBOutlet var shopAddressTextField: NSTextField!
    
    @IBOutlet var mondayBtn: NSButton!
    @IBOutlet var tuesdayBtn: NSButton!
    @IBOutlet var wednesdayBtn: NSButton!
    @IBOutlet var thursdayBtn: NSButton!
    @IBOutlet var fridayBtn: NSButton!
    @IBOutlet var saturdayBtn: NSButton!
    @IBOutlet var sundayBtn: NSButton!
    
    @IBOutlet var mondayOpenTimePicker: NSDatePicker!
    @IBOutlet var tuesdayOpenTimePicker: NSDatePicker!
    @IBOutlet var wednesdayOpenTimePicker: NSDatePicker!
    @IBOutlet var thursdayOpenTimePicker: NSDatePicker!
    @IBOutlet var fridayOpenTimePicker: NSDatePicker!
    @IBOutlet var saturdayOpenTimePicker: NSDatePicker!
    @IBOutlet var sundayOpenTimePicker: NSDatePicker!
    
    @IBOutlet var mondayCloseTimePicker: NSDatePicker!
    @IBOutlet var tuesdayCloseTimePicker: NSDatePicker!
    @IBOutlet var wednesdayCloseTimePicker: NSDatePicker!
    @IBOutlet var thursdayCloseTimePicker: NSDatePicker!
    @IBOutlet var fridayCloseTimePicker: NSDatePicker!
    @IBOutlet var saturdayCloseTimePicker: NSDatePicker!
    @IBOutlet var sundayCloseTimePicker: NSDatePicker!
    
    /// ---for NAMING:
    /// monday
    /// tuesday
    /// wednesday
    /// thursday
    /// friday
    /// saturday
    /// sunday
    
    
    
    //    MARK: - Properties
    
    var testName: String?
    
    //    MARK: - Start Here
    
    override func viewWillAppear() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let testName = testName {
            shopNameTextField.stringValue = testName
        } else {
            shopNameTextField.stringValue = "No String passed!"
        }
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    //    MARK: - Methods
    
    //    MARK: - Actions
    
    @IBAction func mondayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func tuesdayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func wednesdayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func thursdayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func fridayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func saturdayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func sundayBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func okBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func cancelBtnClicked(_ sender: NSButton) {
    }
}
