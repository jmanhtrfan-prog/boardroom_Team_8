//
//  LogInView.swift
//  boardroom_Team_8
//
//  Created by danah alsadan on 04/07/1447 AH.
//

import SwiftUI

struct LogInView: View {
    
    @State private var jobNumber: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
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
                    .frame(width: 460, height: 500)
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
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer().frame(height: 100)
                
                // Title
                Text("Welcome back! Glad to see you, Again!")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.orange)
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.leading)
                
                // Job Number Field (توسيع البوكس فقط)
                TextField("Enter your job number", text: $jobNumber)
                    .padding()
                    .frame(maxWidth: .infinity) // ✅ التوسيع
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                // Password Field (توسيع البوكس فقط)
                HStack {
                    if isPasswordVisible {
                        TextField("Enter your password", text: $password)
                    } else {
                        SecureField("Enter your password", text: $password)
                    }
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity) // ✅ التوسيع
                .background(Color.white.opacity(0.9))
                .cornerRadius(12)
                .padding(.horizontal, 24)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                // Login Button (توسيع البوكس فقط)
                Button {
                    // API Login action here
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity) // ✅ التوسيع
                        .padding()
                        .background(Color(red: 28/255, green: 33/255, blue: 77/255))
                        .cornerRadius(16)
                        .padding(.horizontal, 24)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LogInView()
}
