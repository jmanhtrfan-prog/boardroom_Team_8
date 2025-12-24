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
            
        
           
    Image("Background")
    .resizable()
    .scaledToFill()
    .ignoresSafeArea()
            
VStack(alignment: .leading, spacing: 24) {
                
Spacer().frame(height: 80)
                
                // Title
                Text("Welcome back! Glad to see you, Again!")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.orange)
                    .padding(.horizontal)
                
                // Job Number Field
                TextField("Enter your job number", text: $jobNumber)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
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
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Login Button
                Button {
                    // API Login action here
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 28/255, green: 33/255, blue: 77/255))
                        .cornerRadius(14)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LogInView()
}
