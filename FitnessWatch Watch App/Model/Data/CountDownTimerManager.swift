//
//  CountDownTimerManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 06/06/2024.
//

import SwiftUI
import Combine

class CountdownTimerManager: ObservableObject {
    static let shared = CountdownTimerManager() // Singleton
    
    @Published var timeRemaining: Double = 0.0
    @Published var timerActive: Bool = false
    
    private var timer: Timer?
    private var initialTime: Double = 0.0
    
    private init() {} // Ensure singleton usage
    
    func startTimer(initialTime: Double) {
        if timer == nil {
            self.initialTime = initialTime
            //self.timeRemaining = initialTime
            if self.timeRemaining == 0.0 {
                            self.timeRemaining = initialTime
            }
            timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                if self.timeRemaining > 0.0 {
                    self.timeRemaining -= 0.01
                } else {
                    self.stopTimer()
                    WKInterfaceDevice.current().play(.notification)
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerActive = false
    }
    
    func resetTimer(initialTime: Double) {
        stopTimer()
        self.initialTime = initialTime
        self.timeRemaining = initialTime
    }
}

