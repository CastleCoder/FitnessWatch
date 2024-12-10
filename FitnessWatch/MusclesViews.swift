//
//  MusclesViews.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct MusclesViews: View {
    var date: Date

    @Query private var seriesList: [Series]

    var body: some View {
        List {
            let seriesOnDate = seriesList.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
            let groupedByMuscle = Dictionary(grouping: seriesOnDate) { $0.muscle }
            
            ForEach(Array(groupedByMuscle.keys.sorted()), id: \.self) { muscle in
                NavigationLink(destination: MuscleExerciseDetailView(muscle: muscle, date: date)) {
                    Text(muscle)
                }
            }
        }
        .navigationTitle("\(date, formatter: dateFormatter)")
    }
    


    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    MusclesViews(date: Date())
}
