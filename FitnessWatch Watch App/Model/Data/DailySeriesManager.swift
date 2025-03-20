//
//  DailySeriesManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 06/07/2025.
//

import SwiftUI

class DailySeriesManager: ObservableObject {
    @Published var dailySeries: [Series] = []
    private var currentDate: String
    
    init() {
        currentDate = Self.todayString()
        loadIfSameDay()
    }
    
    func addSeries(_ series: Series) {
        if Self.todayString() != currentDate {
            reset()
        }
        dailySeries.append(series)
    }
    
    func reset() {
        dailySeries = []
        currentDate = Self.todayString()
    }
    
    private func loadIfSameDay() {
        if Self.todayString() != currentDate {
            reset()
        }
    }
    
    private static func todayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
