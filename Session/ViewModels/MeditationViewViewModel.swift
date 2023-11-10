//
//  MeditationViewViewModel.swift
//  Session
//
//  Created by Samuel Orr on 2023-11-08.
//

import Foundation

class MeditationViewViewModel: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isTimerRunning = false
    private var totalTime: Int
    private var timer: Timer?
    var timeString: String {
            String(format: "%d", timeRemaining)
        }

    init(totalTime: Int = 300) {
        self.totalTime = totalTime
        self.timeRemaining = totalTime
    }

    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }

    func tick() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer?.invalidate()
            timer = nil
            isTimerRunning = false
            // Handle completion, e.g., navigate to JournalView or show an alert
        }
    }

    func toggleTimer() {
        isTimerRunning.toggle()
        if isTimerRunning {
            resumeTimer()
        } else {
            pauseTimer()
        }
    }

    func pauseTimer() {
            timer?.invalidate()
            timer = nil
        }

    func resumeTimer() {
        if timeRemaining > 0 {
            startTimer()
        }
    }

    deinit {
        timer?.invalidate()
    }
}
