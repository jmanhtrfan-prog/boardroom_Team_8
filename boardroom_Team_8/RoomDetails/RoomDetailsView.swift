import SwiftUI

struct RoomDetailsView: View {
    @Environment(\.dismiss) private var dismiss

    private let facilities: [String] = ["Wi-Fi", "Screen"]
    private let days: [Int] = [16, 19, 20, 21, 22, 23, 26, 27, 28]
    private let weekDays: [String] = ["Thu","Sun","Mon","Tue","Wed","Thu","Sun","Mon","Tue"]
    private let unavailableDays: Set<Int> = [16, 22, 23]
    @State private var selectedDay: Int = 19

    var body: some View {
        VStack(spacing: 0) {

            // Header
            ZStack(alignment: .top) {
                Color("BoardRoomBlue")
                    .ignoresSafeArea(edges: .top)

                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.boardRoomWhite)
                            .padding(12)
                    }

                    Spacer()

                    Text("Room")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.boardRoomWhite)

                    Spacer()

                    Color.clear.frame(width: 44, height: 44)
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)
            }
            .frame(height: 80)

            // Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // Image
                    Image("RoomImage")
                        .resizable()
                        .frame(height: 260)

                    VStack(alignment: .leading, spacing: 16) {

                        // Floor + Seats
                        HStack {
                            Label("Floor 3", systemImage: "paperplane.fill")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.boardRoomBlack)

                            Spacer()

                            HStack(spacing: 6) {
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.boardRoomOrange)
                                Text("99")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 7)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                            )
                        }

                        // Description
                        Text("Description")
                            .font(.system(size: 16, weight: .semibold))

                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.black)
                            .padding(14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.06), radius: 14, x: 0, y: 6)
                            )

                        // Facilities
                        Text("Facilities")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)

                        HStack(spacing: 10) {
                            ForEach(facilities, id: \.self)
                            { item in
                                HStack(spacing: 8) {
                                    Image(systemName: iconName(for: item))
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.black)

                                    Text(item)
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                                )
                            }
                        }

                        // Calendar title
                        Text("All bookings for March")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                            .padding(.top, 8)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(weekDays.indices, id: \.self) { i in
                                    Text(weekDays[i])
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.gray)
                                        .frame(width: 44)
                                        
                                }
                            }
                        }

                        // Days row
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(days, id: \.self) { day in
                                    Text("\(day)")
                                    
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(day == selectedDay ? .white : .black)
                                        .frame(width: 44, height: 44)
                                        .background(dayBackground(day))
                                        .cornerRadius(20)
                                        .onTapGesture { selectedDay = day }
                                }
                            }
                            .padding(.vertical, 2)
                        }

                        // Booking button
                        Button {
                            // go to success page
                        } label: {
                            Text("Booking")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(Color.boardRoomOrange)
                                .cornerRadius(12)
                        }
                        .padding(.top, 14)
                        .padding(.bottom, 24)

                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    
    
    private func dayBackground(_ day: Int) -> Color {
        if day == selectedDay { return .boardRoomOrange }
        if unavailableDays.contains(day) { return Color.gray.opacity(0.55) }
        return Color.gray.opacity(0.16)
    }

    private func iconName(for facility: String) -> String {
        switch facility.lowercased() {
        case "wi-fi", "wifi":
            return "wifi"
        case "screen":
            return "tv"
        case "projector":
            return "video"
        case "microphone":
            return "mic"
        default:
            return "square.grid.2x2"
        }
    }
}

#Preview {
    NavigationStack {
        RoomDetailsView()
    }
}
