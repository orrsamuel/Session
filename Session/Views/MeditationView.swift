//
//  MeditationView.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import SwiftUI

struct MeditationView: View {
    @StateObject var viewModel = MeditationViewViewModel()
    @State private var circleScale: CGFloat = 1.0
    @State private var isActive = true  // Add this line

    var body: some View {
        ZStack {
            Color.blue.opacity(0.65).edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // Timer Circle
                Circle()
                        .stroke(lineWidth: 5)
                        .foregroundColor(.white)
                        .scaleEffect(circleScale)
                        .frame(width: 200, height: 200)
                        .overlay(
                            Text(viewModel.timeString)
                                .font(.system(size: 60))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        )

                Spacer()

                // Pause/Resume Button
                Button(action: {
                    if isActive {
                        viewModel.pauseTimer()
                    } else {
                        viewModel.resumeTimer()
                    }
                    isActive.toggle()
                }) {
                    Text(isActive ? "Pause" : "Resume")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            viewModel.startTimer()
            startCircleAnimation()
        }
    }

    private func startCircleAnimation() {
        withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
            circleScale = 1.5
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
