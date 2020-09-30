//
//  dataSource.swift
//  ShopTask
//
//  Created by Office-iMac on 2020-09-30.
//

import Foundation
import Cocoa

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

let schedule0 = Shop.WorkSchedule(monday: nil,
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

