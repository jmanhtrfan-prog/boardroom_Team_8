//
//  Untitled.swift
//  boardroom_Team_8
//
//  Created by Jumana on 08/07/1447 AH.
//
import SwiftUI

struct RoomCardView: View {
    let room: Room
    let showDate: Bool
    let dateText: String?
    
    init(room: Room, showDate: Bool = false, dateText: String? = nil) {
        self.room = room
        self.showDate = showDate
        self.dateText = dateText
    }
    
    var body: some View {
        HStack(spacing: 16) {
            // Room Image
            RoomImageView(imageURL: room.imageURL)
                .frame(width: 100, height: 100)
                .cornerRadius(12)
            
            // Room Details
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(room.name)
                        .font(.headline)
                        .foregroundColor(.primaryText)
                    
                    Spacer()
                    
                    // Date badge (if needed)
                    if showDate, let date = dateText {
                        Text(date)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.navyBlue)
                            .cornerRadius(8)
                    }
                }
                
                Text(room.floor)
                    .font(.subheadline)
                    .foregroundColor(.secondaryText)
                
                // Capacity
                HStack(spacing: 4) {
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.primaryOrange)
                        .font(.caption)
                    Text("\(room.capacity)")
                        .font(.subheadline)
                        .foregroundColor(.primaryText)
                }
                
                // Amenities - تحت علامة الأشخاص
                HStack(spacing: 12) {
                    ForEach(room.amenities, id: \.self) { amenity in
                        Image(systemName: amenity)
                            .foregroundColor(.navyBlue)
                            .font(.caption)
                    }
                }
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Room Image View
struct RoomImageView: View {
    let imageURL: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.lightBackground)
            
            // عرض الصورة
            if let imageName = imageURL {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
            } else {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundColor(.secondaryText)
            }
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        RoomCardView(
            room: Room(
                id: "1",
                name: "Creative Space",
                floor: "Floor 5",
                capacity: 1,
                amenities: ["wifi"],
                imageURL: nil,
                isAvailable: true
            )
        )
        
        RoomCardView(
            room: Room(
                id: "2",
                name: "Ideation Room",
                floor: "Floor 3",
                capacity: 16,
                amenities: ["wifi", "display"],
                imageURL: nil,
                isAvailable: false
            ),
            showDate: true,
            dateText: "28 March"
        )
    }
    .padding()
    .background(Color.lightBackground)
}
