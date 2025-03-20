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
    @Query private var items: [Series]
    
    @State private var muscleIos: String = "no muscle"
    @State private var exerciceIos: String = "no exercice"
    @State private var weightIos: Int = 0
    @State private var repIos: Int = 0
    @State private var setIos: Int = 0
    @State private var dateIos: Date? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
                Text("\(muscleIos)")
                Text("\(exerciceIos)")
                Text("\(weightIos)")
                Text("\(repIos)")
                Text("\(setIos)")
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                NavigationLink(destination: HistoricalView()) {
                    Text("Historical")
                }
                Text("\(connectivity.receivedMuscle ?? "no muscle")")
                Text("\(connectivity.receivedExercice ?? "no exercice")")
                Text("\(connectivity.receivedWeight ?? 0)")
                Text("\(connectivity.receivedRep ?? 0)")
                Text("\(connectivity.receivedSet ?? 0)")
                // Affichage de la date formatée
//                if let date = connectivity.receivedDate {
//                    Text("Date reçue : \(date, formatter: dateFormatter)")
//                } else {
//                    Text("Aucune date reçue")
//                }
                
            }
            .onReceive(connectivity.objectWillChange) { _ in
                // Met à jour les variables locales dès qu'un changement est détecté
                muscleIos = connectivity.receivedMuscle ?? "no muscle"
                exerciceIos = connectivity.receivedExercice ?? "no exercice"
                weightIos = connectivity.receivedWeight ?? 0
                repIos = connectivity.receivedRep ?? 0
                setIos = connectivity.receivedSet ?? 0
                dateIos = connectivity.receivedDate
            }
            
        }
        
    }
    private func addItem(){
        let newItem = Series(date: dateIos ?? Date(), muscle: muscleIos, exercise: exerciceIos, weight: Float(weightIos), reps: Float(repIos), sets: setIos)
        context.insert(newItem)
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Series.self, inMemory: true)
}

