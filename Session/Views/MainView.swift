import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                // App Title
                Text("session")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white) // Text color
                    .padding(.top, 50)

                Spacer()

                // Buttons
                VStack(spacing: 20) {
                    NavigationLink(destination: MeditationView()) {
                        Text("Begin")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue.opacity(0.5)) // Text color
                            .background(Color.white) // Button background color
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: HistoryView()) {
                        Text("History")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue.opacity(0.65)) // Text color
                            .background(Color.white) // Button background color
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.title)
                            .padding()
                            .foregroundColor(.blue.opacity(0.65)) // Text color
                            .background(Color.white) // Button background color
                            .cornerRadius(10)
                    }
                }
                .padding()

                Spacer()
            }
            .background(Color.blue.opacity(0.65)) // Background color for the entire view
            .edgesIgnoringSafeArea(.all) // Extend the background color to the edges of the screen
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
