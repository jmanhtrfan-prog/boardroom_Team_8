//
//  SuccessIcon.swift
//  boardroom_Team_8
//
//  Created by danah alsadan on 05/07/1447 AH.
//

import SwiftUI

struct SuccessIcon: View {
    var body: some View {
        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 398)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .white]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )

                Spacer()
            }
            .offset(y: -55)

            VStack(spacing: 18) {

                Spacer().frame(height: 85)

                Image("SuccessIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 253, height: 253)

                Text("Booking Success!")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(Color(red: 28/255, green: 33/255, blue: 77/255))

                // البوكس مع شادو
                descriptionBox()
                    .padding(.top, 8)

                Spacer()

                Button(action: {}) {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.831, green: 0.369, blue: 0.224))
                        .cornerRadius(14)
                }
                .padding(.bottom, 24)
            }
        }
    }

    // MARK: - Description Box (White Box + Shadow)
    @ViewBuilder
    private func descriptionBox() -> some View {

        let navy = Color(red: 28/255, green: 33/255, blue: 77/255)

        let attributedText: AttributedString = {
            var att = AttributedString(
                "Your booking for Ideation Room on Sunday,\nMarch 19, 2023 is confirmed."
            )

            att.foregroundColor = navy
            att.font = .system(size: 16, weight: .regular)

            if let r1 = att.range(of: "Ideation Room") {
                att[r1].font = .system(size: 16, weight: .bold)
            }
            if let r2 = att.range(of: "Sunday") {
                att[r2].font = .system(size: 16, weight: .bold)
            }
            if let r3 = att.range(of: "March 19, 2023") {
                att[r3].font = .system(size: 16, weight: .bold)
            }

            return att
        }()

        Text(attributedText)
            .multilineTextAlignment(.center)
            .padding(.vertical, 14)
            .padding(.horizontal, 18)
            .frame(width: 358)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(
                        color: Color.black.opacity(0.08),
                        radius: 8,
                        x: 0,
                        y: 4
                    )
            )
    }
}

#Preview {
    SuccessIcon()
}
