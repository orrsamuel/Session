//
//  ContentView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            NavigationView {
                LoginView()
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
