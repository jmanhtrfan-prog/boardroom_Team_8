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
            // Background Image with fixed aspect ratio
            Image("Background")
                .resizable()
                .frame(width: 460, height: 500) // استخدام القياسات الأصلية
                .scaledToFit()
                .position(x: UIScreen.main.bounds.width / 2, y: 199) // مركز الصورة بالنسبة للشاشة
            
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer().frame(height: 100)
                
                // Title
                Text("Welcome back! Glad to see you, Again!")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.orange)
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.leading)
                
                // Job Number Field
                TextField("Enter your job number", text: $jobNumber)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                
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
                    }
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(12)
                .padding(.horizontal, 24)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                
                // Login Button
                Button {
                    // API Login action here
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 28/255, green: 33/255, blue: 77/255))
                        .cornerRadius(16)
                        .padding(.horizontal, 24)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.1)) // للحماية لو الخلفية ما غطت كامل الشاشة
    }
}

#Preview {
    LogInView()
}
