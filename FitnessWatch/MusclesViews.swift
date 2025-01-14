//
//  MusclesViews.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct MusclesViews: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var seriesList: [Series]
    let selectedDate: Date

    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        // Filtrer les séries pour la date sélectionnée
        _seriesList = Query(filter: #Predicate { $0.date == selectedDate })
    }

    var body: some View {
        List {
            ForEach(Array(Set(seriesList.map { $0.muscle })), id: \.self) { muscle in
                NavigationLink(destination: MuscleExerciseDetailView(selectedMuscle: muscle, selectedDate: selectedDate)) {
                    Text(muscle)
                        .font(.headline)
                }
            }
        }
        .navigationTitle("Muscles")
    }
}

#Preview {
    MusclesViews(selectedDate: Date())
}
