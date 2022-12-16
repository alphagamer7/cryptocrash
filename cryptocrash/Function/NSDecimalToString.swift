//
//  DecimalToString.swift
//  cryptocrash
//
//  Created by Athif on 2022/11/18.
//

import Foundation
func NSDecimalToString (num1: NSDecimalNumber) -> String{
    let num: Decimal = Decimal(Double(truncating: num1 as NSNumber))
    let doubleValue = Double(truncating: num as NSNumber)
    let str : String = String(format: "%.2f", doubleValue)
    return str
}
