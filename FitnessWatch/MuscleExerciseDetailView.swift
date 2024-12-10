//
//  MuscleExerciseDetailView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct MuscleExerciseDetailView: View {
    var muscle: String
    var date: Date
    
    @Query private var itemSerie: [Series]

    var body: some View {
        List {
            let filteredSeries = itemSerie.filter {
                Calendar.current.isDate($0.date, inSameDayAs: date) && $0.muscle == muscle
            }
            let groupedByExercise = Dictionary(grouping: filteredSeries) { $0.exercise }
            
            ForEach(groupedByExercise.keys.sorted(), id: \.self) { exercise in
                VStack(alignment: .leading) {
                    Text(exercise)
                        .font(.headline)
                    
                    if let seriesForExercise = groupedByExercise[exercise] {
                        let sortedSeries = seriesForExercise.sorted { $0.date < $1.date }
                        
                        ForEach(Array(sortedSeries.enumerated()), id: \.element.id) { index, serie in
                            Text("\(String(format: "%.0f", serie.weight)) kg, \(String(format: "%.0f", serie.reps)) reps, Set n°\((index + 1)) ")
                                .font(.subheadline)
                                .fontWeight(.thin)
                        }
                    }
                }
            }
        }
        .navigationTitle(muscle)
    }
}

#Preview {
    MuscleExerciseDetailView(muscle: "Pectoraux", date: Date())
}
