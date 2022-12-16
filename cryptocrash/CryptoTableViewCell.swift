//
//  CryptoTableViewCell.swift
//  Crypto Bank
//
//  Created by Yujia on 2022/4/1.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var IconImage: UIImageView!
    
    @IBOutlet weak var TotalVol: UILabel!
    @IBOutlet weak var StatsPrice: UILabel!
    @IBOutlet weak var CryptoName: UILabel!
    @IBOutlet weak var CryptoId: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
