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
    
    @IBOutlet var mondayClosedLabel: NSTextField!
    @IBOutlet var tuesdayClosedLabel: NSTextField!
    @IBOutlet var wednesdayClosedLabel: NSTextField!
    @IBOutlet var thursdayClosedLabel: NSTextField!
    @IBOutlet var fridayClosedLabel: NSTextField!
    @IBOutlet var saturdayClosedLabel: NSTextField!
    @IBOutlet var sundayClosedLabel: NSTextField!
    
    /// ---for NAMING:
    /// monday
    /// tuesday
    /// wednesday
    /// thursday
    /// friday
    /// saturday
    /// sunday
    
    
    
    //    MARK: - Properties
    
    var shopToEdit: Shop?
    
    //    MARK: - Start Here
    
    override func viewWillAppear() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let shop = shopToEdit {
            shopNameTextField.stringValue = shop.name
            shopAddressTextField.stringValue = shop.address
            
        } else {
            shopNameTextField.stringValue = "No Shop selected!"
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
        if mondayBtn.state.rawValue == 0 {
            mondayOpenTimePicker.isHidden = true
            mondayCloseTimePicker.isHidden = true
            mondayClosedLabel.isHidden = false
        } else {
            mondayOpenTimePicker.isHidden = false
            mondayCloseTimePicker.isHidden = false
            mondayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func tuesdayBtnClicked(_ sender: NSButton) {
        if tuesdayBtn.state.rawValue == 0 {
            tuesdayOpenTimePicker.isHidden = true
            tuesdayCloseTimePicker.isHidden = true
            tuesdayClosedLabel.isHidden = false
        } else {
            tuesdayOpenTimePicker.isHidden = false
            tuesdayCloseTimePicker.isHidden = false
            tuesdayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func wednesdayBtnClicked(_ sender: NSButton) {
        if wednesdayBtn.state.rawValue == 0 {
            wednesdayOpenTimePicker.isHidden = true
            wednesdayCloseTimePicker.isHidden = true
            wednesdayClosedLabel.isHidden = false
        } else {
            wednesdayOpenTimePicker.isHidden = false
            wednesdayCloseTimePicker.isHidden = false
            wednesdayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func thursdayBtnClicked(_ sender: NSButton) {
        if thursdayBtn.state.rawValue == 0 {
            thursdayOpenTimePicker.isHidden = true
            thursdayCloseTimePicker.isHidden = true
            thursdayClosedLabel.isHidden = false
        } else {
            thursdayOpenTimePicker.isHidden = false
            thursdayCloseTimePicker.isHidden = false
            thursdayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func fridayBtnClicked(_ sender: NSButton) {
        if fridayBtn.state.rawValue == 0 {
            fridayOpenTimePicker.isHidden = true
            fridayCloseTimePicker.isHidden = true
            fridayClosedLabel.isHidden = false
        } else {
            fridayOpenTimePicker.isHidden = false
            fridayCloseTimePicker.isHidden = false
            fridayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func saturdayBtnClicked(_ sender: NSButton) {
        if saturdayBtn.state.rawValue == 0 {
            saturdayOpenTimePicker.isHidden = true
            saturdayCloseTimePicker.isHidden = true
            saturdayClosedLabel.isHidden = false
        } else {
            saturdayOpenTimePicker.isHidden = false
            saturdayCloseTimePicker.isHidden = false
            saturdayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func sundayBtnClicked(_ sender: NSButton) {
        if sundayBtn.state.rawValue == 0 {
            sundayOpenTimePicker.isHidden = true
            sundayCloseTimePicker.isHidden = true
            sundayClosedLabel.isHidden = false
        } else {
            sundayOpenTimePicker.isHidden = false
            sundayCloseTimePicker.isHidden = false
            sundayClosedLabel.isHidden = true
        }
    }
    
    @IBAction func okBtnClicked(_ sender: NSButton) {
    }
    
    @IBAction func cancelBtnClicked(_ sender: NSButton) {
    }
}
