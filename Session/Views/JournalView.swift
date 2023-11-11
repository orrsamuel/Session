//
//  JournalView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct JournalView: View {
    @StateObject var viewModel: JournalViewViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextEditor(text: $viewModel.journalText)
                .padding()
                .border(Color.gray, width: 1)
                .padding()

            Spacer()

            Button(action: {
                viewModel.saveJournalEntry()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save and Exit")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarTitle("Journal", displayMode: .inline)
        .padding()
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(viewModel: JournalViewViewModel(meditationTime: 300)) // Example meditation time
    }
}
