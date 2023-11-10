//
//  LoginView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation
import Combine

class LoginViewViewModel: ObservableObject {
    // Published properties that the view can bind to
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // Combine's AnyCancellable, used to store subscriptions
    private var cancellables = Set<AnyCancellable>()

    // Placeholder for an authentication service (e.g., Firebase)
    private var authService: AuthenticationService

    init(authService: AuthenticationService = AuthenticationService()) {
        self.authService = authService
    }

    func login() {
        isLoading = true
        errorMessage = nil

        // Call the authentication service to perform the login
        authService.login(email: email, password: password)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] user in
                // Handle successful login, e.g., navigate to the home screen
                // You can use user information as needed
                self?.handleSuccessfulLogin(user: user)
            }
            .store(in: &cancellables)
    }

    private func handleSuccessfulLogin(user: User) {
        // Implement what happens after a successful login
        // For example, update the UI, store user data, etc.
    }
}

// Placeholder for the User model
struct User {
    // Define user properties
}

// Placeholder for the AuthenticationService
class AuthenticationService {
    func login(email: String, password: String) -> AnyPublisher<User, Error> {
        // Implement the login logic, possibly using Firebase
        // Return a publisher that emits a User object or an error
        // For now, this is just a placeholder
        fatalError("Authentication service login method not implemented")
    }
}
