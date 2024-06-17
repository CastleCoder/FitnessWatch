//
//  HistoricalView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/06/2024.
//

import SwiftUI

struct HistoricalView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        List {
            let groupedByDate = Dictionary(grouping: dataManager.seriesList) { Calendar.current.startOfDay(for: $0.date) }
            ForEach(groupedByDate.keys.sorted(), id: \.self) { date in
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
        .environmentObject(DataManager())
}

