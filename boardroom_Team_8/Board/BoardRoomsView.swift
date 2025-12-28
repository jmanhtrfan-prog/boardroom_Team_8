//
//  Untitled.swift
//  boardroom_Team_8
//
//  Created by Jumana on 08/07/1447 AH.
//
import SwiftUI
struct BoardRoomsView: View {
    // MARK: - ViewModel
    @StateObject private var viewModel = BoardRoomViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Navigation Bar
                Text("Board Rooms")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.navyBlue)
                
                ScrollView {
                    LazyVStack(spacing: 20, pinnedViews: []) {
                        // Hero Banner
                        HeroBannerView(onBookNow: {
                            viewModel.navigateToBooking()
                        })
                        .padding(.horizontal, 16)
                        
                        // My Booking Section - يطلع بس لما يكون في حجوزات
                        if !viewModel.myBookings.isEmpty {
                            MyBookingSection(
                                bookings: viewModel.myBookings,
                                onSeeAll: {
                                    viewModel.showAllBookings()
                                }
                            )
                            .padding(.horizontal, 16)
                        }
                        
                        // Calendar Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("All bookings for March")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primaryText)
                                .padding(.horizontal, 16)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(viewModel.calendarDays) { day in
                                        Button(action: {
                                            viewModel.selectDay(day)
                                        }) {
                                            CalendarDayView(day: day)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        
                        // All Bookings Section
                        AllBookingsSection(rooms: viewModel.allRooms)
                            .padding(.horizontal, 16)
                    }
                    .padding(.vertical)
                }
                .background(Color.lightBackground)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            // جلب البيانات لما الصفحة تفتح
            await viewModel.fetchAllRooms()
            await viewModel.fetchMyBookings()
        }
    }
}

// MARK: - Hero Banner
struct HeroBannerView: View {
    let onBookNow: () -> Void
    
    var body: some View {
        ZStack {
            // الصورة
            Image("1")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipped()
                .cornerRadius(16)
            
            // الكلام والزر فوق الصورة مباشرة
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("All board rooms")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.95))
                        
                        Text("Available today")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.top, 35)
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: onBookNow) {
                        HStack(spacing: 10) {
                            Text("Book now")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                            
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 36, height: 36)
                                
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.primaryOrange)
                            }
                        }
                    }
                    .padding(.trailing, 35)
                }
                .padding(.bottom, 20)
            }
        }
        .frame(height: 180)
    }
}

// MARK: - My Booking Section
struct MyBookingSection: View {
    let bookings: [Booking]
    let onSeeAll: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("My booking")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryText)
                
                Spacer()
                
                Button(action: onSeeAll) {
                    Text("See All")
                        .font(.subheadline)
                        .foregroundColor(.primaryOrange)
                }
            }
            
            ForEach(bookings) { booking in
                RoomCardView(
                    room: booking.room,
                    showDate: true,
                    dateText: booking.dateText
                )
            }
        }
    }
}

// MARK: - Calendar Day View
struct CalendarDayView: View {
    let day: CalendarDay
    
    var body: some View {
        VStack(spacing: 4) {
            Text(day.dayName)
                .font(.caption2)
                .foregroundColor(.secondaryText)
            
            ZStack {
                Circle()
                    .fill(Color.cardBackground)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                
                if day.isToday {
                    Circle()
                        .fill(Color.primaryOrange)
                        .frame(width: 50, height: 50)
                }
                
                Text("\(day.dayNumber)")
                    .font(.body)
                    .fontWeight(day.isToday ? .bold : .regular)
                    .foregroundColor(day.isToday ? .white : .primaryText)
            }
        }
    }
}

// MARK: - All Bookings Section
struct AllBookingsSection: View {
    let rooms: [Room]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(rooms) { room in
                RoomCardView(room: room)
            }
        }
    }
}

#Preview {
    BoardRoomsView()
}
