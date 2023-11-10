//
//  AuthenticationService.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-10.
//

import Foundation
import FirebaseAuth

class AuthenticationService {
    static let shared = AuthenticationService()

    // Register a new user
    func register(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let firebaseUser = authResult?.user {
                let user = User(id: firebaseUser.uid, email: firebaseUser.email ?? "")
                completion(.success(user))
            }
        }
    }

    // Log in an existing user
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let firebaseUser = authResult?.user {
                let user = User(id: firebaseUser.uid, email: firebaseUser.email ?? "")
                completion(.success(user))
            }
        }
    }

    // Add other methods as needed (e.g., password reset, log out)
}
