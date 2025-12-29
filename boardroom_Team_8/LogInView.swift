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

                // Background Image merged with white
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 398)
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
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer().frame(height: 50)
                
                // ✅ Title مطابق للصورة + سبيس واضح
                Text("Welcome back! Glad\nto see you, Again!")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(
                        Color(red: 212/255, green: 94/255, blue: 57/255) // #D45E39
                    )
                    .lineSpacing(6)
                    .padding(.horizontal, 24)
                
                // ✅ السبيس الواضح تحت العنوان (مثل Figma)
                Spacer().frame(height: 1)
                
                // Job Number Field
                TextField("Enter your job number", text: $jobNumber)
                    .padding(.horizontal, 16)
                    .frame(width: 358, height: 56)
                    .background(Color.white)
                    .cornerRadius(7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.18), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
                    .padding(.horizontal, 24)
                
                // Password Field
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
                            .padding(.trailing, 4)
                    }
                }
                .padding(.horizontal, 16)
                .frame(width: 358, height: 56)
                .background(Color.white)
                .cornerRadius(7)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.18), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
                .padding(.horizontal, 24)
                
                // Login Button
                Button {
                    // API Login action here
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 358, height: 50)
                        .background(
                            Color(red: 35/255, green: 36/255, blue: 85/255) // #232455
                        )
                        .cornerRadius(10)
                }
                .padding(.horizontal, 24)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LogInView()
}
