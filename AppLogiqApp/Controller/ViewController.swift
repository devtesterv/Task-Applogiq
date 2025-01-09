import UIKit

class ViewController: UIViewController {
    var selectedItem = 0
    var pageTitle = ["Living room", "Bed room 1", "Bed room 2","Bed room 3","Bed room 4"]
    var mockDeviceOptions: [DeviceOption] = []
    @IBOutlet weak var OptionListCollectionView: UICollectionView!
    @IBOutlet weak var roomOptionListCollectionView: UICollectionView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var acImageView: UIImageView!
    @IBOutlet weak var acView: UIView!
    @IBOutlet weak var asOnOffSwitchBtn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        mockDeviceOptions = roomDevices[pageTitle[0]] ?? []
        OptionListCollectionView.delegate = self
        OptionListCollectionView.dataSource = self
        OptionListCollectionView.register(UINib(nibName: "MenuNameCell", bundle: nil), forCellWithReuseIdentifier: "MenuNameCell")
        roomOptionListCollectionView.delegate = self
        roomOptionListCollectionView.dataSource = self
        roomOptionListCollectionView.register(UINib(nibName: "roomOptionCell", bundle: nil), forCellWithReuseIdentifier: "roomOptionCell")
        if let layout = roomOptionListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 0
            layout.minimumInteritemSpacing = spacing
            layout.minimumLineSpacing = spacing
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        }
        increaseButton.layer.cornerRadius = 10
        increaseButton.layer.shadowColor = UIColor.gray.cgColor
        increaseButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        increaseButton.layer.shadowOpacity = 0.5
        increaseButton.layer.shadowRadius = 4
        increaseButton.layer.masksToBounds = false
        
        decreaseButton.layer.cornerRadius = 10
        decreaseButton.layer.shadowColor = UIColor.gray.cgColor
        decreaseButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        decreaseButton.layer.shadowOpacity = 0.5
        decreaseButton.layer.shadowRadius = 4
        decreaseButton.layer.masksToBounds = false
        
        
        acImageView.layer.cornerRadius = 20
        acImageView.layer.shadowColor = UIColor.gray.cgColor
        acImageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        acImageView.layer.shadowOpacity = 0.5
        acImageView.layer.shadowRadius = 4
        acImageView.layer.masksToBounds = false
        switchStateChanged(asOnOffSwitchBtn)
    }
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        updateUIBasedOnSwitchState()
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        print("Add Button Clicked")
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        print("Minus Button Clicked")
    }
    @IBAction func connectionTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "ConnectionsViewController") as! ConnectionsViewController
        self.present(destVC, animated: true, completion: nil)
    }
    @IBAction func profileTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(destVC, animated: true, completion: nil)
    }
    func updateUIBasedOnSwitchState() {
        let isEnabled = asOnOffSwitchBtn.isOn
        increaseButton.isUserInteractionEnabled = isEnabled
        decreaseButton.isUserInteractionEnabled = isEnabled
        let disabledColor = UIColor.lightGray
        let enabledColor = UIColor.systemBlue
        increaseButton.tintColor = isEnabled ? enabledColor : disabledColor
        decreaseButton.tintColor = isEnabled ? enabledColor : disabledColor
        print("Switch is now \(isEnabled ? "ON" : "OFF")")
        print("Add Button User Interaction: \(isEnabled ? "Enabled" : "Disabled")")
        print("Minus Button User Interaction: \(isEnabled ? "Enabled" : "Disabled")")
        if mockDeviceOptions.count > 0 {
            if let index = mockDeviceOptions.firstIndex(where: { $0.name == "AC" }) {
                mockDeviceOptions.remove(at: index)
            }
            roomOptionListCollectionView.reloadData()
        }
    }
}

extension ViewController  : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == OptionListCollectionView {
            return pageTitle.count
        } else if collectionView == roomOptionListCollectionView {
            if (self.mockDeviceOptions.count == 0) {
                self.roomOptionListCollectionView.setEmptyMessage("No setting is here")
                acView.isHidden = true
            } else {
                self.roomOptionListCollectionView.restore()
            }
            
            return self.mockDeviceOptions.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == OptionListCollectionView {
            let cell = OptionListCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuNameCell", for: indexPath) as! MenuNameCell
            cell.menuNameLabel.text = pageTitle[indexPath.row]
            cell.menuNameLabel.textColor =  (selectedItem == indexPath.row) ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)  : UIColor.lightGray
            cell.menuNameLabel.font = (selectedItem == indexPath.row) ?  cell.menuNameLabel.font.withSize(15) : cell.menuNameLabel.font.withSize(15)
            cell.backGroundView.backgroundColor = (selectedItem == indexPath.row) ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)  : UIColor.clear
            return cell
        } else if collectionView == roomOptionListCollectionView {
            let cell = roomOptionListCollectionView.dequeueReusableCell(withReuseIdentifier: "roomOptionCell", for: indexPath) as! roomOptionCell
            if indexPath.row < mockDeviceOptions.count {
                let device = mockDeviceOptions[indexPath.row]
                cell.configure(with: device)
            }
            acView.isHidden = mockDeviceOptions.contains(where: { $0.isAC })
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == OptionListCollectionView {
            return CGSize(width: Int(self.view.frame.width) / pageTitle.count, height: 45)
        } else  if collectionView == roomOptionListCollectionView {
            let totalItems = collectionView.numberOfItems(inSection: indexPath.section)
            let spacing: CGFloat = 5
            let collectionViewWidth = collectionView.frame.width
            if totalItems == 1 {
                return CGSize(width: collectionViewWidth, height: 200)
            } else {
                let numberOfColumns: CGFloat = 2
                let totalSpacing = (numberOfColumns - 1) * spacing + spacing * 2
                let availableWidth = collectionViewWidth - totalSpacing
                let cellWidth = availableWidth / numberOfColumns
                return CGSize(width: cellWidth, height: cellWidth)
            }
        }
        return CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == roomOptionListCollectionView {
            return 5
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == roomOptionListCollectionView {
            return 5
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == OptionListCollectionView {
            selectedItem = indexPath.row
            let selectedRoom = pageTitle[selectedItem]
            mockDeviceOptions = roomDevices[selectedRoom] ?? []
            OptionListCollectionView.reloadData()
            roomOptionListCollectionView.reloadData()
            if let firstDevice = mockDeviceOptions.first {
                asOnOffSwitchBtn.isOn = firstDevice.isOn
            }
            updateUIBasedOnSwitchState()
        }
    }
}
