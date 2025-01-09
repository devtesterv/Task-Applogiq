//
//  Untitled.swift
//  AppLogiqApp
//
//  Created by CV on 08/01/25.
//

import Foundation

// Enum to define device types
enum DeviceType {
    case temperature
    case smartDevice
}

// Model for a device option
struct DeviceOption {
    let id: Int
    let name: String
    let icon: String
    let isOn: Bool
    let type: DeviceType
    let isAC: Bool
}
 
 
var roomDevices: [String: [DeviceOption]] = [
    "Living room": [
        DeviceOption(id: 1, name: "AC", icon: "air-conditioner", isOn: true, type: .temperature, isAC: true),
        DeviceOption(id: 2, name: "Smart TV", icon: "monitor", isOn: false, type: .smartDevice, isAC: false),
        DeviceOption(id: 3, name: "Table Lamp", icon: "lamp", isOn: false, type: .smartDevice, isAC: false),
        DeviceOption(id: 4, name: "Router", icon: "router-svgrepo-com 1", isOn: true, type: .smartDevice, isAC: false),
        DeviceOption(id: 5, name: "Speakers", icon: "speaker", isOn: false, type: .smartDevice, isAC: false)
    ],
    "Bed room 1": [
        DeviceOption(id: 0, name: "AC", icon: "air-conditioner", isOn: false, type: .temperature, isAC: true),
        DeviceOption(id: 3, name: "Table Lamp", icon: "lamp", isOn: false, type: .smartDevice, isAC: false),
        DeviceOption(id: 4, name: "Router", icon: "router-svgrepo-com 1", isOn: true, type: .smartDevice, isAC: false)
    ],
    "Bed room 2": [
        DeviceOption(id: 0, name: "AC", icon: "air-conditioner", isOn: true, type: .temperature, isAC: true),
        DeviceOption(id: 1, name: "Table Lamp", icon: "lamp", isOn: true, type: .temperature, isAC: false)
    ],
    "Bed room 3": [
        DeviceOption(id: 0, name: "AC", icon: "air-conditioner", isOn: true, type: .temperature, isAC: true),
        DeviceOption(id: 5, name: "Speakers", icon: "speaker", isOn: false, type: .smartDevice, isAC: false)
    ],
    "Bed room 4": []
]


