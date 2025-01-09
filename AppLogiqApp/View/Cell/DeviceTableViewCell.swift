//
//  DeviceTableViewCell.swift
//  AppLogiqApp
//
//  Created by CV on 09/01/25.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
