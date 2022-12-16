//
//  getDate.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/4/25.
//

import Foundation

func getDate() -> String{
    //set date type in the detail view controller, in order to be saved in the core data
    let date = Date()
    let df = DateFormatter()
    df.dateFormat = "MM/dd"
    let dateString = df.string(from: date)
    return dateString
}
