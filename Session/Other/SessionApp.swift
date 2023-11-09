//
//  SessionApp.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import FirebaseCore
import SwiftUI

@main
struct SessionApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
