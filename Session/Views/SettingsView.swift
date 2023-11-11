//
//  SettingsView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Meditation")) {
                    Picker("Meditation Length", selection: $viewModel.meditationLength) {
                        ForEach(1...60, id: \.self) { minute in
                            Text("\(minute) minutes").tag(minute)
                        }
                    }
                }

                Section(header: Text("Music")) {
                    Picker("Music Selection", selection: $viewModel.selectedMusic) {
                        ForEach(viewModel.musicOptions, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                }

                Section(header: Text("Theme")) {
                    Toggle("Dark Mode", isOn: $viewModel.isDarkModeEnabled)
                }

                Section {
                    NavigationLink(destination: ProfileView()) {
                        Text("Manage Profile")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}

