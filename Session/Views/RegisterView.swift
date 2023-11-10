//
//  RegisterView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) { // Adjust spacing for overall layout
                // Refined Blue Banner
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.blue)
                        .frame(height: 200) // Adjusted height for a more balanced look
                        .edgesIgnoringSafeArea(.top)

                    Text("Session")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                }

                // Improved Form Aesthetics
                Form {
                    Section(header: Text("Create Your Account").font(.headline)) {
                        TextField("Email Address", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("Confirm Password", text: $confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.vertical, 10)

                    // Enhanced Button Styling
                    Button(action: {
                        // Register action
                    }) {
                        Text("Register")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .disabled(email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
                }
                .padding(.horizontal, -10) // Remove default Form padding

                Spacer()
            }
            .background(Color.white.edgesIgnoringSafeArea(.all)) // Set background to white
        }
    }
}

// Preview
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

