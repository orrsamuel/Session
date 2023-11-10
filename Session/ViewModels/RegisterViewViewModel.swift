//
//  RegisterViewViewModel.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation
import Combine

class RegisterViewViewModel: ObservableObject {
    // Published properties to bind with your view
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isRegistered: Bool = false
    @Published var errorMessage: String?

    // Reference to the authentication service
    private var authService: AuthenticationService

    // Initializer
    init(authService: AuthenticationService = .shared) {
        self.authService = authService
    }

    // Function to handle registration
    func register() {
        // Check if passwords match
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        authService.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    // Handle successful registration
                    // You can store the user data or update the UI as needed
                    self?.isRegistered = true
                    print("Registered user: \(user.email)")
                case .failure(let error):
                    // Handle error
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
