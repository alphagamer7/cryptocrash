//
//  calculateToString.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/4/21.
//

import Foundation
func calculateToString (num1: NSDecimalNumber, num2: NSDecimalNumber) -> String{
    
    let num : Decimal = ((num1 as Decimal) - (num2 as Decimal)) * 100 / (num1 as Decimal)
    let doubleValue = Double(truncating: num as NSNumber)
    let str : String = String(format: "%.2f", doubleValue) + "%"
    return str
}
