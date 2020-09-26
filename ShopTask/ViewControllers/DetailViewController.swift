//
//  DetailViewController.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-26.
//

import Cocoa

class DetailViewController: NSViewController {
    //    MARK: Outlets:
    //    @IBOutlet var ImageView: NSImageView!
    
    @IBOutlet var shopNameLabel: NSTextField!
    @IBOutlet var shopAddressLabel: NSTextField!
    
    
    //    MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopNameLabel.stringValue = ""
        shopAddressLabel.stringValue = ""
        
    }
    
    //    MARK: - Methods:
    func shopSelected(name: String, address: String) {
        shopNameLabel.stringValue = name
        shopAddressLabel.stringValue = address
    }
}
