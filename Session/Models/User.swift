//
//  User.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation

class User {
    var id: String
    var email: String
    var name: String?
    // Add other user properties as needed

    init(id: String, email: String, name: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
        // Initialize other properties as needed
    }

    // Add other methods or computed properties as needed
}
