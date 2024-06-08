//
//  Chronometer.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 21/05/2024.
//

import SwiftUI

struct Chronometer: View {
    
    @ObservedObject var timerManager = TimerManager.shared
    
    var body: some View {
        VStack {
            Text(timeString(from: timerManager.elapsedTime))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    if timerManager.timerActive {
                        timerManager.stopTimer()
                    } else {
                        timerManager.startTimer()
                    }
                }) {
                    Image(systemName: timerManager.timerActive ? "stop.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(timerManager.timerActive ? .red : .green)
                }
                .buttonStyle(PlainButtonStyle())
                
                if !timerManager.timerActive {
                    Spacer()
                    Button(action: timerManager.resetTimer) {
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
    }
    
    func timeString(from time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time - Double(Int(time))) * 100)
        return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds)),\(String(format: "%02d", milliseconds))"
    }
    
}


#Preview {
    Chronometer()
}
