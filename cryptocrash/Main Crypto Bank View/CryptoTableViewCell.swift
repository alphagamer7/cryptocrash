//
//  CryptoTableViewCell.swift
//  cryptocrash
//
//  Created by Athif on 2022-11-18.
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
