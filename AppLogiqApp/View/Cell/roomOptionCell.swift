//
//  roomOptionCell.swift
//  AppLogiqApp
//
//  Created by CV on 05/01/25.
//

import UIKit

class roomOptionCell: UICollectionViewCell {

    @IBOutlet weak var optionImageview: UIImageView!
    @IBOutlet weak var rangeConnectiionImageview: UIImageView!
    @IBOutlet weak var optionTitleLabel: UILabel!
    @IBOutlet weak var onOffStageLabel: UILabel!
    @IBOutlet weak var onOffButton: UISwitch!
    @IBOutlet weak var imageBGView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageBGView.layer.cornerRadius = 25
        imageBGView.layer.shadowColor = UIColor.gray.cgColor
        imageBGView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageBGView.layer.shadowOpacity = 0.5
        imageBGView.layer.shadowRadius = 4
        imageBGView.layer.masksToBounds = false
        
    }

}
