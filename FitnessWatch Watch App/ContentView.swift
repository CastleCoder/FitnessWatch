//
//  ContentView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var dataManager = DataManager()
    
    @Environment(\.modelContext) private var context
    @State private var ExerciceChoose: String = "À choisir"
    @State private var groupName: String = "À choisir"
    @Query private var items: [Series]
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: CurrentInformationsView().environmentObject(dataManager)) {
                    Text("Current Informations")
                }
                NavigationLink(destination: HistoricalView().environmentObject(dataManager)) {
                    Text("View History")
                }
            }
        }
        .environmentObject(dataManager)
    }
}

#Preview {
    ContentView()
}

