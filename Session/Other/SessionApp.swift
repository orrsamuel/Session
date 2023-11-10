//
//  SessionApp.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI
import Firebase

@main
struct SessionApp: App {
    init() {
        // Configure Firebase
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            // Your main view goes here
            MainView()
        }
    }
}
