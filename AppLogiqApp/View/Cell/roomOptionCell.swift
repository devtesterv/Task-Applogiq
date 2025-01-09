
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

    func configure(with device: DeviceOption) {
        // Reset all UI elements before setting the new data
        rangeConnectiionImageview.image = nil
        optionImageview.image = nil
        optionTitleLabel.text = nil
        onOffStageLabel.text = nil
        rangeConnectiionImageview.image = UIImage(systemName: "wave.3.up")
        // Configure the cell based on the device
        if device.name == "Speakers" {
            if let image = UIImage(named: "bluetooth-2") {
                rangeConnectiionImageview.image = image.withRenderingMode(.alwaysTemplate)
            }
        }
        optionImageview.image = UIImage(named: device.icon)
        optionTitleLabel.text = device.name
        onOffButton.isOn = device.isOn
        onOffStageLabel.text = device.isOn ? "On" : "Off"
        
        rangeConnectiionImageview.tintColor = device.isOn ? UIColor.darkGray : UIColor.lightGray
        
        // Avoid adding multiple targets
        onOffButton.removeTarget(nil, action: nil, for: .allEvents)
        onOffButton.addTarget(self, action: #selector(onOffSwitchToggled(_:)), for: .valueChanged)
    }

    @objc func onOffSwitchToggled(_ sender: UISwitch) {
        if sender.isOn {
            rangeConnectiionImageview.tintColor = UIColor.darkGray
        } else {
            rangeConnectiionImageview.tintColor = UIColor.lightGray
        }
        onOffStageLabel.text = sender.isOn ? "On" : "Off"
        
    }
    
}
