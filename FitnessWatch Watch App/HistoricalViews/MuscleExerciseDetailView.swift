//
//  MuscleExerciseDetailView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 10/06/2024.
//

import SwiftUI

struct MuscleExerciseDetailView: View {
    var muscle: String
    var series: [Series]
    
    var body: some View {
        List {
            let groupedByExercise = Dictionary(grouping: series) { $0.exercise }
            ForEach(groupedByExercise.keys.sorted(), id: \.self) { exercise in
                VStack(alignment: .leading) {
                    Text(exercise)
                        .font(.headline)
                    ForEach(groupedByExercise[exercise]!) { serie in
                        Text("\(String(format: "%.0f", serie.weight)) kg, \(String(format: "%.0f", serie.reps)) reps, Set n°\((serie.sets)+1) ")
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
                }
            }
        }
        //.navigationTitle(muscle)
    }
}

#Preview {
    MuscleExerciseDetailView(muscle: "Pectoraux", series: [Series(date: Date(), muscle: "Pectoraux", exercise: "Bench Press", weight: 100, reps: 10, sets: 3)])
}
