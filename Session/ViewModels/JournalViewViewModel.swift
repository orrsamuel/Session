//
//  JournalViewViewModel.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation

class JournalViewViewModel: ObservableObject {
    @Published var journalText: String = ""
    private let meditationTime: Int

    init(meditationTime: Int) {
        self.meditationTime = meditationTime
    }

    func saveJournalEntry() {
        let entry = JournalEntry(date: Date(), meditationTime: meditationTime, content: journalText)
        // Implement the logic to save the entry
        // This could involve saving to a database, user defaults, or any other form of persistent storage
        // After saving, you might want to clear the text or navigate away from the view
    }
}

struct JournalEntry {
    let date: Date
    let meditationTime: Int
    let content: String
}
