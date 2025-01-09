//
//  ConnectionsViewController.swift
//  AppLogiqApp
//
//  Created by CV on 09/01/25.
//

import UIKit
struct Device {
    let name: String
    var isPaired: Bool
}

class ConnectionsViewController: UIViewController {
    
    var devices: [Device] = [
            Device(name: "Device 1", isPaired: false),
            Device(name: "Device 2", isPaired: true),
            Device(name: "Device 3", isPaired: false)
        ]
    
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var listPairTV: UITableView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
        self.listPairTV.delegate = self
        self.listPairTV.dataSource = self
        self.listPairTV.register(UINib(nibName: "DeviceTableViewCell", bundle: nil), forCellReuseIdentifier: "DeviceTableViewCell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ConnectionsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           // Create a reusable cell
        let cell = listPairTV.dequeueReusableCell(withIdentifier: "DeviceTableViewCell", for: indexPath) as! DeviceTableViewCell
           
           let device = devices[indexPath.row]
           
           // Set the cell's text and accessory type based on the pairing status
            cell.deviceNameLabel?.text = device.name
           if device.isPaired {
               cell.accessoryType = .checkmark
           } else {
               cell.accessoryType = .none
           }
           
           return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Toggle pairing status
            devices[indexPath.row].isPaired.toggle()
            
            // Reload the selected row to update its accessory
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            // Deselect the row after tapping
            tableView.deselectRow(at: indexPath, animated: true)
        }
    // Customize the header view
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = .clear
            
            let headerLabel = UILabel()
            headerLabel.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44)
            headerLabel.text = "Connect device"
            headerLabel.textAlignment = .center
            headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
            headerView.addSubview(headerLabel)
            return headerView
        }
        
        // Optional: Set height for the header
         func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 44
        }
}
