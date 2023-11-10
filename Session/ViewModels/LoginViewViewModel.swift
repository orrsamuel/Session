//
//  LoginView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation
import Combine

class LoginViewViewModel: ObservableObject {
    // Published properties to bind with your view
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    
    // Reference to the authentication service
    private var authService: AuthenticationService
    
    // Initializer
    init(authService: AuthenticationService = .shared) {
        self.authService = authService
    }
    
    // Function to handle login
    func login() {
        authService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    // Handle successful login
                    // You can store the user data or update the UI as needed
                    self?.isLoggedIn = true
                    print("Logged in user: \(user.email)")
                case .failure(let error):
                    // Handle error
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
