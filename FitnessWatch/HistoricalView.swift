//
//  HistoricalView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct HistoricalView: View {
    @Query(sort: \Series.date, order: .reverse) private var seriesList: [Series]

    var body: some View {
        List {
            let groupedByDate = Dictionary(grouping: seriesList) { series in
                Calendar.current.startOfDay(for: series.date)
            }
            
            let sortedDates = groupedByDate.keys.sorted(by: >)
            ForEach(sortedDates, id: \.self) { date in
                NavigationLink(destination: MusclesViews(date: date)) {
                    Text("\(date, formatter: dateFormatter)")
                }
            }
        }
        .navigationTitle("Historique")
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    HistoricalView()
//        .modelContainer(for: Series.self, inMemory: true)
}
