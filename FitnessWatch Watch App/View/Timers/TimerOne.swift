//
//  TimerView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 20/05/2024.
//

import SwiftUI

struct TimerOne: View {
    @ObservedObject var timerManager = CountdownTimerManager.shared
    
    let initialTime: Double = 60.0
    
    var body: some View {
        VStack {
            Text(timeString(from: timerManager.timeRemaining))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    if timerManager.timerActive {
                        timerManager.stopTimer()
                    } else {
                        timerManager.startTimer(initialTime: initialTime)
                    }
                }) {
                    Image(systemName: timerManager.timerActive ? "stop.circle.fill" : "restart.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(timerManager.timerActive ? .red : .green)
                }
                .buttonStyle(PlainButtonStyle())
                
                if !timerManager.timerActive {
                    Spacer()
                    Button(action: {
                        timerManager.resetTimer(initialTime: initialTime)
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
                
            }
        }
        .onAppear {
            if !timerManager.timerActive {
                timerManager.resetTimer(initialTime: initialTime)
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

struct TimerOne_Previews: PreviewProvider {
    static var previews: some View {
        TimerOne()
    }
}
