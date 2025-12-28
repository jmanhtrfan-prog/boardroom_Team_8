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

            // Base white background
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // Top background image (blended)
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 430, height: 500)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                Color.white
                            ]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )

                Spacer()
            }
            .offset(y: -60)
            
            VStack(spacing: 29) {

                Spacer()

                Image("SuccessIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 253, height: 253)
                    .padding(.top,-100)
                
                Text("Booking Success!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.15, green: 0.17, blue: 0.36))

                Text("Your booking for Ideation Room on Sunday,\nMarch 19, 2023 is confirmed.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Spacer()

                // Done Button (fixed size)
                Button(action: {
                    // Action
                }) {
                    Text("Done")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.831, green: 0.369, blue: 0.224)) // اللون الجديد #D45E39
                        .cornerRadius(14)
                }
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    SuccessIcon()
}
