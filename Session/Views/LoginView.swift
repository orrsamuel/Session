//
//  LoginView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) { // Adjust spacing for overall layout
                // Refined Blue Banner
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.blue.opacity(0.65))
                        .frame(height: 200) // Adjusted height for a more balanced look
                        .edgesIgnoringSafeArea(.top)

                    Text("Session")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                }

                // Improved Form Aesthetics
                Form {
                    Section(header: Text("Welcome Back").font(.headline)) {
                        TextField("Email Address", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.vertical, 10)

                    // Enhanced Button Styling
                    Button(action: {
                        // Log In action
                    }) {
                        Text("Log In")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue.opacity(0.65))
                            .cornerRadius(10)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                }
                .padding(.horizontal, -10) // Remove default Form padding

                // Create Account
                VStack {
                    Text("Start Seshing")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)

                Spacer()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all)) // Set background to white
        }
    }
}

// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
