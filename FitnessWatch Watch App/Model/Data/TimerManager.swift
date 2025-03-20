//
//  TimerManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 26/05/2024.
//

import Foundation
import Combine
import WatchKit

class TimerManager: ObservableObject {
    static let shared = TimerManager()
    
    @Published var elapsedTime: Double = 0.0
    @Published var timerActive: Bool = false
    
    private var timer: Timer?
    private var startTime: Date?
    
    private let maxDuration: Double = 3600.0 // 60 minutes en secondes
    
//    func startTimer() {
//        if !timerActive {
//            startTime = Date().addingTimeInterval(-elapsedTime) // Reprend à partir du temps écoulé
//            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
//                if let startTime = self.startTime {
//                    self.elapsedTime = Date().timeIntervalSince(startTime)
//                }
//            }
//            RunLoop.current.add(timer!, forMode: .common)
//            timerActive = true
//        }
//    }
    
    func startTimer() {
            if !timerActive {
                startTime = Date().addingTimeInterval(-elapsedTime)
                timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    if let startTime = self.startTime {
                        let currentElapsed = Date().timeIntervalSince(startTime)
                        
                        if currentElapsed >= self.maxDuration { // 🔶 Vérifie si on dépasse 60 min
                            self.elapsedTime = self.maxDuration
                            self.stopTimer()
                            WKInterfaceDevice.current().play(.failure) // 🔶 Vibration à l'arrêt
                        } else {
                            self.elapsedTime = currentElapsed
                        }
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
