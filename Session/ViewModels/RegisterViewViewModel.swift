//
//  RegisterViewViewModel.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation
import Combine

class RegisterViewViewModel: ObservableObject {
    // Published properties that the view can bind to
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // Combine's AnyCancellable, used to store subscriptions
    private var cancellables = Set<AnyCancellable>()

    // Placeholder for an authentication service (e.g., Firebase)
    private var authService: AuthenticationService

    init(authService: AuthenticationService = AuthenticationService()) {
        self.authService = authService
    }

    func register() {
        guard validateInputs() else { return }

        isLoading = true
        errorMessage = nil

        // Call the authentication service to perform the registration
        authService.register(email: email, password: password)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] user in
                // Handle successful registration
                self?.handleSuccessfulRegistration(user: user)
            }
            .store(in: &cancellables)
    }

    private func validateInputs() -> Bool {
        // Validate the inputs (e.g., email format, password match)
        // Return true if valid, false otherwise
        // Update errorMessage with the validation error if needed
        // This is a placeholder implementation
        return password == confirmPassword // Add more validation as needed
    }

    private func handleSuccessfulRegistration(user: User) {
        // Implement what happens after a successful registration
        // For example, navigate to the home screen or show a success message
    }
}

// Placeholder for the User model
struct User {
    // Define user properties
}

// Placeholder for the AuthenticationService
class AuthenticationService {
    func register(email: String, password: String) -> AnyPublisher<User, Error> {
        // Implement the registration logic, possibly using Firebase
        // Return a publisher that emits a User object or an error
        // For now, this is just a placeholder
        fatalError("Authentication service register method not implemented")
    }
}
