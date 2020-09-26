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
    let workSchedule: WorkSchedule
}

struct WorkSchedule {
    var monday: WorkHours?
    var tuesday: WorkHours?
    var wednesday: WorkHours?
    var thursday: WorkHours?
    var friday: WorkHours?
    var saturday: WorkHours?
    var sunday: WorkHours?
}

struct WorkHours {
    let from: String
    let to: String
}


