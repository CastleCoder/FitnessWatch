//
//  HistoricalView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct HistoricalView: View {
    @Query private var items: [Series]

    var body: some View {
        List(items) { item in
            HStack {
                Text(item.exercise)
                    .font(.headline)
                Spacer()
                Text("\(item.weight, specifier: "%.2f") kg")
                    .font(.subheadline)
            }
        }
        .navigationTitle("Historique")
    }
}

#Preview {
    HistoricalView()
        .modelContainer(for: Series.self, inMemory: true)
}
