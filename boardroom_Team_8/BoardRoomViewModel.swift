//
//  Untitled.swift
//  boardroom_Team_8
//
//  Created by Jumana on 08/07/1447 AH.
//


import Foundation
import SwiftUI

@MainActor
class BoardRoomViewModel: ObservableObject {
    // MARK: - Published Properties (البيانات اللي تتغير)
    @Published var myBookings: [Booking] = []
    @Published var allRooms: [Room] = []
    @Published var calendarDays: [CalendarDay] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // MARK: - Initialization
    init() {
        loadSampleData()
        generateCalendarDays()
    }
    
    // MARK: - Sample Data (مؤقت - بعدين تشيله لما تربط API)
    private func loadSampleData() {
        allRooms = [
            Room(
                id: "1",
                name: "Creative Space",
                floor: "Floor 5",
                capacity: 1,
                amenities: ["wifi"],
                imageURL: "Creative Space",
                isAvailable: true
            ),
            Room(
                id: "2",
                name: "Ideation Room",
                floor: "Floor 3",
                capacity: 16,
                amenities: ["wifi", "display"],
                imageURL: "Ideation Room.",
                isAvailable: false
            ),
            Room(
                id: "3",
                name: "Inspiration ...",
                floor: "Floor 1",
                capacity: 18,
                amenities: ["wifi", "mic.fill", "videoprojector"],
                imageURL: "Inspiration",
                isAvailable: false
            )
        ]
        
        // الحجوزات فاضية - بتتعبى لما المستخدم يحجز
        myBookings = []
    }
    
    private func generateCalendarDays() {
        calendarDays = [
            CalendarDay(dayName: "Thu", dayNumber: 16, monthName: "March", isToday: true),
            CalendarDay(dayName: "Sun", dayNumber: 19, monthName: "March", isToday: false),
            CalendarDay(dayName: "Mon", dayNumber: 20, monthName: "March", isToday: false),
            CalendarDay(dayName: "Tue", dayNumber: 21, monthName: "March", isToday: false),
            CalendarDay(dayName: "Wed", dayNumber: 22, monthName: "March", isToday: false),
            CalendarDay(dayName: "Thu", dayNumber: 23, monthName: "March", isToday: false),
            CalendarDay(dayName: "Sun", dayNumber: 26, monthName: "March", isToday: false),
            CalendarDay(dayName: "Mon", dayNumber: 27, monthName: "March", isToday: false),
            CalendarDay(dayName: "Tue", dayNumber: 28, monthName: "March", isToday: false)
        ]
    }
    
    // MARK: - API Functions (هنا بعدين تحط API calls)
    
    /// جلب جميع الغرف من API
    func fetchAllRooms() async {
        isLoading = true
        errorMessage = nil
        
        // TODO: هنا حط API call
        // مثال:
        // do {
        //     let response = try await APIService.shared.getRooms()
        //     self.allRooms = response
        // } catch {
        //     self.errorMessage = "Failed to fetch rooms: \(error.localizedDescription)"
        // }
        
        // مؤقت: نستخدم sample data
        try? await Task.sleep(nanoseconds: 500_000_000)
        loadSampleData()
        
        isLoading = false
    }
    
    /// جلب حجوزات المستخدم من API
    func fetchMyBookings() async {
        isLoading = true
        errorMessage = nil
        
        // TODO: هنا حط API call
        // مثال:
        // do {
        //     let response = try await APIService.shared.getMyBookings()
        //     self.myBookings = response
        // } catch {
        //     self.errorMessage = "Failed to fetch bookings: \(error.localizedDescription)"
        // }
        
        isLoading = false
    }
    
    /// حجز غرفة
    func bookRoom(roomId: String, date: Date) async {
        isLoading = true
        errorMessage = nil
        
        // TODO: هنا حط API call للحجز
        // مثال:
        // do {
        //     let booking = try await APIService.shared.bookRoom(roomId: roomId, date: date)
        //     self.myBookings.append(booking)
        // } catch {
        //     self.errorMessage = "Failed to book room: \(error.localizedDescription)"
        // }
        
        // مؤقت: نضيف حجز تجريبي
        if let room = allRooms.first(where: { $0.id == roomId }) {
            let newBooking = Booking(
                id: UUID().uuidString,
                room: room,
                dateText: "28 March"
            )
            myBookings.append(newBooking)
        }
        
        isLoading = false
    }
    
    /// اختيار يوم من الكالندر
    func selectDay(_ day: CalendarDay) {
        print("Selected day: \(day.dayNumber) \(day.monthName)")
        // TODO: هنا حط المنطق (مثلاً فلترة الغرف حسب اليوم)
    }
    
    /// عرض جميع الحجوزات
    func showAllBookings() {
        print("Show all bookings tapped")
        // TODO: هنا حط navigation للصفحة الثانية
    }
    
    /// الذهاب لصفحة الحجز
    func navigateToBooking() {
        print("Book now tapped")
        // TODO: هنا حط navigation لصفحة الحجز
    }
}
