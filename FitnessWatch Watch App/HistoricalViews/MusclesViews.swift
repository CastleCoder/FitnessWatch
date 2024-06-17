//
//  MusclesViews.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 10/06/2024.
//

import SwiftUI

struct MusclesViews: View {
    @EnvironmentObject var dataManager: DataManager
    var date: Date
    
    var body: some View {
        List {
            let seriesOnDate = dataManager.seriesList.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
            let groupedByMuscle = Dictionary(grouping: seriesOnDate) { $0.muscle }
            ForEach(groupedByMuscle.keys.sorted(), id: \.self) { muscle in
                NavigationLink(destination: MuscleExerciseDetailView(muscle: muscle, series: groupedByMuscle[muscle]!)) {
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
        .environmentObject(DataManager())
}
