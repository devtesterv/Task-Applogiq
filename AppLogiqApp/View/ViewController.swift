//
//  ViewController.swift
//  AppLogiqApp
//
//  Created by CV on 05/01/25.
//

import UIKit

class ViewController: UIViewController {
    var selectedItem = 0
    var pageTitle = ["Living room", "Bed room 1", "Bed room 2","Bed room 3","Bed room 4"]
    
    
    
    @IBOutlet weak var OptionListCollectionView: UICollectionView!
    @IBOutlet weak var roomOptionListCollectionView: UICollectionView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var acImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        OptionListCollectionView.delegate = self
        OptionListCollectionView.dataSource = self
        OptionListCollectionView.register(UINib(nibName: "MenuNameCell", bundle: nil), forCellWithReuseIdentifier: "MenuNameCell")
        roomOptionListCollectionView.delegate = self
        roomOptionListCollectionView.dataSource = self
        roomOptionListCollectionView.register(UINib(nibName: "roomOptionCell", bundle: nil), forCellWithReuseIdentifier: "roomOptionCell")
        // Do any additional setup after loading the view.
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
        
    }
    
}

extension ViewController  : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == OptionListCollectionView {
            return pageTitle.count
        } else if collectionView == roomOptionListCollectionView {
            return 4
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
            if indexPath.row == 0 {
                cell.optionImageview.image = UIImage(named: "monitor") // Smart TV
                cell.rangeConnectiionImageview.image = UIImage(systemName: "wave.3.up") // Smart TV
                cell.optionTitleLabel.text = "Smart TV"
            } else if indexPath.row == 1 {
                cell.optionImageview.image = UIImage(named: "router-svgrepo-com 1")
                cell.rangeConnectiionImageview.image = UIImage(systemName: "wave.3.up") // Router
                cell.optionTitleLabel.text = "Router"
            } else if indexPath.row == 2 {
                cell.optionImageview.image = UIImage(named: "lamp")
                cell.rangeConnectiionImageview.image = UIImage(systemName: "wave.3.up") // Lamp
                cell.optionTitleLabel.text = "Lamp"
            } else if indexPath.row == 3 {
                cell.optionImageview.image = UIImage(named: "speaker")
                cell.rangeConnectiionImageview.image = UIImage(named: "bluetooth-2") // Speaker
                cell.optionTitleLabel.text = "Speaker"
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == OptionListCollectionView {
            return CGSize(width: Int(self.view.frame.width) / pageTitle.count, height: 45)
        } else if collectionView == roomOptionListCollectionView {
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            let numberOfColumns: CGFloat = isIpad ? 1 : 2
            let spacing: CGFloat = 5 // Adjust for inter-item spacing
            
            // Calculate the width for each item
            let totalSpacing = spacing * (numberOfColumns + 1) // Spaces between columns + padding
            let availableWidth = collectionView.frame.width - totalSpacing
            let cellWidth = availableWidth / numberOfColumns
            
            return CGSize(width: cellWidth, height: isIpad ? 200 : cellWidth) // Square on mobile, fixed height on iPad
        }
        return CGSize(width: 0, height: 0) // Default size in case no match
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == roomOptionListCollectionView {
            return 5
        }
        return 10
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == roomOptionListCollectionView {
            return 5 // Horizontal spacing
        }
        return 10
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        OptionListCollectionView.reloadData()
    }
}
