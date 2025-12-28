//
//  Untitled.swift
//  boardroom_Team_8
//
//  Created by Jumana on 08/07/1447 AH.
//
import Foundation

// MARK: - Room Model
struct Room: Identifiable {
    let id: String
    let name: String
    let floor: String
    let capacity: Int
    let amenities: [String] // SF Symbols names: "wifi", "display", "mic.fill", etc.
    let imageURL: String? // هنا تحط اسم الصورة من Assets أو URL
    let isAvailable: Bool
}

// MARK: - Booking Model
struct Booking: Identifiable {
    let id: String
    let room: Room
    let dateText: String // مثل "28 March"
}

// MARK: - Calendar Day Model
struct CalendarDay: Identifiable {
    let id = UUID()
    let dayName: String // "Thu", "Sun", etc.
    let dayNumber: Int
    let monthName: String // "March", "April", etc.
    let isToday: Bool
}

// MARK: - Calendar Month Model
struct CalendarMonth: Identifiable {
    let id = UUID()
    let name: String
    let days: [CalendarDay]
}
