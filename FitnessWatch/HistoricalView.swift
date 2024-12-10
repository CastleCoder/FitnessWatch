//
//  HistoricalView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 10/11/2024.
//

import SwiftUI
import SwiftData

struct HistoricalView: View {
    @Query var seriesList: [Series] // Récupérer les données de SwiftData

        var body: some View {
            NavigationView {
                List(seriesList) { series in
                    VStack(alignment: .leading) {
                        Text("Page des series")
                        Text(series.exercise)
                            .font(.headline)
                        Text("Muscle : \(series.muscle)")
                        Text("Poids : \(series.weight, specifier: "%.2f") kg")
                        Text("Répétitions : \(Int(series.reps))")
                        Text("Sets : \(series.sets)")
                        Text("Date : \(series.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
                .navigationTitle("Séries Validées")
            }
        }
}

#Preview {
    HistoricalView()
}
