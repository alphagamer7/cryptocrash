//
//  Crypto.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/4/19.
//

import Foundation
class Crypto: Codable{
    var asset_id_quote: String
    var asset_id_base: String
    var src_side_quote: [SrcData]
}

class SrcData: Codable{
    var asset: String
    var rate: Decimal
    var volume: Decimal
}
