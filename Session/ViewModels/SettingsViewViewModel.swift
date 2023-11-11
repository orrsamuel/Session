//
//  SettingsViewViewModel.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation

class SettingsViewViewModel: ObservableObject {
    @Published var selectedMeditationTime: Int = 10 // Default or saved value
    @Published var selectedMusic: String = "Nature Sounds" // Default or saved value
    @Published var isDarkModeEnabled: Bool = false // Default or saved value
    

    let musicOptions = ["Nature Sounds", "Ambient Melody", "Silence"]
    
    func saveMeditationTime() {
        UserDefaults.standard.set(selectedMeditationTime, forKey: "meditationTime")
    }

    // Additional logic for saving and retrieving settings
    // This can be implemented using UserDefaults or a similar persistence mechanism
}
