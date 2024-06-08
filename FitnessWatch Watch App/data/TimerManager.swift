//
//  TimerManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 26/05/2024.
//

import SwiftUI
import Combine

class TimerManager: ObservableObject {
    static let shared = TimerManager() // Singleton
    
    @Published var elapsedTime: Double = 0.0
    @Published var timerActive: Bool = false
    @Published var timeRemaining: Double = 0.0
    
    private var timer: Timer?
    private var startTime: Date?
    private var initialTime: Double = 0.0
    
    
    private init() {} // Ensure singleton usage
    
    func startTimer() {
        if timer == nil {
            startTime = Date()
            timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.elapsedTime = Date().timeIntervalSince(self.startTime ?? Date())
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timerActive = false
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        elapsedTime = 0.0
        startTime = nil
    }
}
