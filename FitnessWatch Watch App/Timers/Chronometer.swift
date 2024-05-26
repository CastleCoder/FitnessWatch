//
//  Chronometer.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 21/05/2024.
//

import SwiftUI

struct Chronometer: View {
    
    @State private var elapsedTime: Double = 0.0
    @State private var timerActive = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text(timeString(from: elapsedTime))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    if timerActive {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Image(systemName: timerActive ? "stop.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(timerActive ? .red : .green)
                }
                .buttonStyle(PlainButtonStyle())
                
                if !timerActive {
                    Spacer()
                    Button(action: resetTimer) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }
        }
        .onAppear(perform: resetTimer)
    }
    
    func timeString(from time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time - Double(Int(time))) * 100)
        return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds)),\(String(format: "%02d", milliseconds))"
    }
    
    func startTimer() {
        if timer == nil {
            timerActive = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                elapsedTime += 0.01
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerActive = false
    }
    
    func resetTimer() {
        elapsedTime = 0.0
    }
}

#Preview {
    Chronometer()
}
