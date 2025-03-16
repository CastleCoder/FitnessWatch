//
//  TimerManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 26/05/2024.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    static let shared = TimerManager()
    
    @Published var elapsedTime: Double = 0.0
    @Published var timerActive: Bool = false
    
    private var timer: Timer?
    private var startTime: Date?
    
    func startTimer() {
        if !timerActive {
            startTime = Date().addingTimeInterval(-elapsedTime) // Reprend à partir du temps écoulé
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                if let startTime = self.startTime {
                    self.elapsedTime = Date().timeIntervalSince(startTime)
                }
            }
            RunLoop.current.add(timer!, forMode: .common)
            timerActive = true
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerActive = false
    }
    
    func resetTimer() {
        stopTimer()
        elapsedTime = 0.0
    }
}
