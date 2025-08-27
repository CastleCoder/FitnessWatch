//
//  ContentView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    
    init() {
        Connectivity.shared.activateConnectivity()
    }
    
    
    
    
    @ObservedObject var connectivity: Connectivity = Connectivity.shared
    
  
    
    @Environment(\.modelContext) private var context
    @Query private var items: [Series]
    
    @State private var muscleIos: String = "no muscle"
    @State private var exerciceIos: String = "no exercice"
    @State private var weightIos: Int = 0
    @State private var repIos: Int = 0
    @State private var setIos: Int = 0
    @State private var dateIos: Date? = nil
    
    @State private var lastReceivedSet: Int = 0
    @State private var lastReceivedMuscle: String = ""
    @State private var lastReceivedExercice: String = ""
    @State private var isAddingItem = false // Bloqueur d'ajout rapide
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
                Text("\(muscleIos)")
                Text("\(exerciceIos)")
                Text("\(weightIos)")
                Text("\(repIos)")
                Text("\(setIos)")
                
                //                Button(action: addItem) {
                //                    Label("Add Item", systemImage: "plus")
                //                }
                
                NavigationLink(destination: HistoricalView()) {
                    Text("Historical")
                }
            }
            .onAppear {
                Connectivity.shared.modelContext = context
            }
            .onReceive(connectivity.objectWillChange) { _ in
                // 👇 On passe le ModelContext à Connectivity
                connectivity.modelContext = context
                
                muscleIos = connectivity.receivedMuscle ?? "no muscle"
                exerciceIos = connectivity.receivedExercice ?? "no exercice"
                weightIos = connectivity.receivedWeight ?? 0
                repIos = connectivity.receivedRep ?? 0
                setIos = connectivity.receivedSet ?? 0
                dateIos = connectivity.receivedDate
                
                print("✅ Reçu depuis la montre : \(muscleIos), \(exerciceIos), \(weightIos), \(repIos), \(setIos), \(String(describing: dateIos))")
                
                
                addItem()
            }
        }
    }
    
    
    
    private func addItem() {
        guard !isAddingItem else { return } // Empêche les ajouts multiples rapides
        guard muscleIos != "no muscle" else { return }
        
        isAddingItem = true
        
        let newItem = Series(
            date: dateIos ?? Date(),
            muscle: muscleIos,
            exercise: exerciceIos,
            weight: Float(weightIos),
            reps: Float(repIos),
            sets: setIos
        )
        context.insert(newItem)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isAddingItem = false // Réautorise l'ajout après 500ms
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Series.self, inMemory: true)
}
