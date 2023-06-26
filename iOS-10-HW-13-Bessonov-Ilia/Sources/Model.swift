//
//  Model.swift
//  iOS-10-HW-13-Bessonov-Ilia
//
//  Created by i0240 on 25.06.2023.
//

import UIKit

enum CellType {
    case infoID
    case switchButton
    case label
    case image
    case none
}

struct Settings: Hashable {
    var icon: UIImage
    var name: String
    var background: UIColor
    var type: CellType
}

extension Settings {
    static var settings: [[Settings]] = [
        // Main Info
        [Settings(icon: UIImage(systemName: "circle.fill")!, name: "I0240", background: .systemGray3, type: .infoID)],
        // First cells
        [Settings(icon: UIImage(systemName: "airplane")!, name: "Airplane Mode", background: .systemOrange, type: .switchButton),
        Settings(icon: UIImage(systemName: "wifi")!, name: "Wi-Fi", background: .systemBlue, type: .label),
        Settings(icon: UIImage(named: "bluetooth")!, name: "Bluetooth", background: .systemBlue, type: .label),
        Settings(icon: UIImage(systemName: "antenna.radiowaves.left.and.right")!, name: "Mobile Data", background: .systemGreen, type: .none),
        Settings(icon: UIImage(systemName: "personalhotspot")!, name: "Personal Hotspot", background: .systemGreen, type: .label),
        Settings(icon: UIImage(named: "vpn")!, name: "VPN", background: .systemBlue, type: .label)],
        // Second Cells
        [Settings(icon: UIImage(systemName: "bell.badge.fill")!, name: "Notifications", background: .systemRed, type: .none),
        Settings(icon: UIImage(systemName: "speaker.wave.2.fill")!, name: "Sounds & Haptics", background: .systemRed, type: .none),
        Settings(icon: UIImage(systemName: "moon.fill")!, name: "Focus", background: .purple, type: .none),
        Settings(icon: UIImage(systemName: "hourglass")!, name: "Screen Time", background: .purple, type: .none)],
        // Third Cells
        [Settings(icon: UIImage(systemName: "gear")!, name: "General", background: .systemGray, type: .image),
        Settings(icon: UIImage(systemName: "switch.2")!, name: "Control Centre", background: .systemGray, type: .none),
        Settings(icon: UIImage(systemName: "textformat.size")!, name: "Display & Brightness", background: .systemBlue, type: .none),
        Settings(icon: UIImage(systemName: "apps.iphone")!, name: "Home Screen", background: .systemBlue, type: .none),
        Settings(icon: UIImage(systemName: "figure.walk.circle")!, name: "Accessibility", background: .systemBlue, type: .none),
        Settings(icon: UIImage(systemName: "circle.hexagongrid")!, name: "Wallpaper", background: .systemMint, type: .none),
        Settings(icon: UIImage(named: "siri")!, name: "Siri & Search", background: .systemPink, type: .none),
        Settings(icon: UIImage(systemName: "touchid")!, name: "Touch ID & Passcode", background: .systemRed, type: .none),
        Settings(icon: UIImage(systemName: "sos")!, name: "Emergency SOS", background: .red, type: .none),
        Settings(icon: UIImage(systemName: "microbe.fill")!, name: "Exposure Notifications", background: .systemRed, type: .none),
        Settings(icon: UIImage(systemName: "battery.100")!, name: "Battery", background: .systemGreen, type: .none),
        Settings(icon: UIImage(systemName: "hand.raised.fill")!, name: "Privacy", background: .systemBlue, type: .none)]
    ]
}
