//
//  Untitled.swift
//  boardroom_Team_8
//
//  Created by Jumana on 08/07/1447 AH.
//
import SwiftUI

extension Color {
    // Primary Colors من التصميم
    static let primaryOrange = Color(hex: "#D45E39") // البرتقالي الأساسي
    static let navyBlue = Color(hex: "#232455") // الكحلي الغامق
    
    // Background Colors
    static let lightBackground = Color(hex: "#F3F3F3") // الرمادي الفاتح للخلفية
    static let cardBackground = Color(hex: "#FFFFFF") // أبيض للكاردات
    
    // Text Colors
    static let primaryText = Color(hex: "#000000") // أسود للنص الأساسي
    static let secondaryText = Color(hex: "#6A707C") // رمادي للنص الثانوي
    static let tertiaryText = Color(hex: "#969696") // رمادي فاتح للنص الإضافي
    
    // Status Colors
    static let availableGreen = Color(red: 144/255, green: 238/255, blue: 144/255)
    static let unavailableRed = Color(red: 255/255, green: 182/255, blue: 193/255)
    
    // Helper function for hex colors
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
