//
//  ContentView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @ObservedObject var connectivity: Connectivity = Connectivity.shared
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
                NavigationLink(destination: HistoricalView()) {
                    Text("Historical")
                }
                Text("\(connectivity.receivedMuscle ?? "no muscle")")
                Text("\(connectivity.receivedExercice ?? "no exercice")")
                Text("\(connectivity.receivedWeight ?? 0)")
                Text("\(connectivity.receivedRep ?? 0)")
                Text("\(connectivity.receivedSet ?? 0)")
                // Affichage de la date formatée
                if let date = connectivity.receivedDate {
                    Text("Date reçue : \(date, formatter: dateFormatter)")
                } else {
                    Text("Aucune date reçue")
                }
            }
        }
    }
}

// Formatter pour formater la date reçue
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    ContentView()
}
