//
//  MuscleExerciseDetailView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct MuscleExerciseDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var seriesList: [Series]
    let selectedMuscle: String
    let selectedDate: Date

    init(selectedMuscle: String, selectedDate: Date) {
        self.selectedMuscle = selectedMuscle
        self.selectedDate = selectedDate
        // Filtrer les séries pour le muscle et la date sélectionnés
        _seriesList = Query(filter: #Predicate { $0.muscle == selectedMuscle && $0.date == selectedDate })
    }

    var body: some View {
        List {
            ForEach(seriesList) { series in
                VStack(alignment: .leading) {
                    Text(series.exercise)
                        .font(.headline)
                    HStack {
                        Text("Weight: \(series.weight, specifier: "%.1f") kg")
                        Text("Reps: \(Int(series.reps))")
                        Text("Sets: \(series.sets)")
                    }
                    .font(.subheadline)
                }
            }
        }
        .navigationTitle("\(selectedMuscle) Details")
    }
}

#Preview {
    MuscleExerciseDetailView(selectedMuscle: "Pectoraux", selectedDate: Date())
}
