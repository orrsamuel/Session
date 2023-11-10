//
//  JournalView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct JournalView: View {
    @State private var journalText: String = ""
    let meditationTime: Int
    let onSave: (JournalEntry) -> Void

    var body: some View {
        VStack {
            TextEditor(text: $journalText)
                .border(Color.gray, width: 1) // Adds a border to the text editor
                .padding()

            Button("Save and Exit") {
                let entry = JournalEntry(date: Date(), meditationTime: meditationTime, content: journalText)
                onSave(entry)
                // Code to exit the view
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Journal")
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(meditationTime: 300, onSave: { _ in })
    }
}

struct JournalEntry {
    let date: Date
    let meditationTime: Int
    let content: String
}

