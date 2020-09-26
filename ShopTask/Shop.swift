//
//  Shop.swift
//  ShopTask
//
//  Created by Anton on 2020-09-26.
//

import Foundation

struct Shop{
    let name: String
    let address: String
    let workSchedule: workSchedule
    
    struct workSchedule {
        let monday: WorkHours?
        let tuesday: WorkHours?
        let wednesday: WorkHours?
        let thursday: WorkHours?
        let friday: WorkHours?
        let saturday: WorkHours?
        let sunday: WorkHours?
    }
    
    struct WorkHours {
        let from: String
        let to: String
    }
}


