//
//  DataManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 13/06/2024.
//

import SwiftUI
import SwiftData

class DataManager: ObservableObject {
    func addSeries(muscle: String, exercise: String, weight: Float, reps: Float, sets: Int, context: ModelContext) {
        let newSeries = Series(date: Date(), muscle: muscle, exercise: exercise, weight: weight, reps: reps, sets: sets)
        context.insert(newSeries)
    }
    
    func deleteSeries(muscle: String, exercise: String, weight: Float, reps: Float, sets: Int, context: ModelContext) {
        let newSeries = Series(date: Date(), muscle: muscle, exercise: exercise, weight: weight, reps: reps, sets: sets)
        context.delete(newSeries)
    }
}

