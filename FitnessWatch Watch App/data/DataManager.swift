//
//  DataManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 13/06/2024.
//

import SwiftUI
import SwiftData

class DataManager: ObservableObject {
    @Environment(\.modelContext) private var context
    @Query private var items: [Series]
    
    func addSeries(muscle: String, exercise: String, weight: Float, reps: Float, sets: Int) {
        let newSeries = Series(date: Date(), muscle: muscle, exercise: exercise, weight: weight, reps: reps, sets: sets)
        context.insert(newSeries)
    }
    
    
    
}

/*class DataManager: ObservableObject {
 @Published var seriesList: [Series] = []
 
 func addSeries(_ series: Series) {
 seriesList.append(series)
 }
 
 func updateSeries(_ series: Series) {
 if let index = seriesList.firstIndex(where: { $0.id == series.id }) {
 seriesList[index] = series
 }
 }
 
 func deleteSeries(_ series: Series) {
 if let index = seriesList.firstIndex(where: { $0.id == series.id }) {
 seriesList.remove(at: index)
 }
 }
 }
 */
