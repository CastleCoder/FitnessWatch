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
    
    @Query private var items: [Series]
    
    var body: some View {
        
        NavigationStack {
            Text("Bienvenue  👋")
                .font(.headline)
                .foregroundColor(.white)
            VStack {
                NavigationStack {
                    VStack {
                        NavigationLink(destination: CurrentInformationsView().environmentObject(dataManager)) {
                            Text("Commencer")
                        }
                        NavigationLink(destination: HistoricalView().environmentObject(dataManager)) {
                            Text("Historique")
                        }
                    }
                }
                .environmentObject(dataManager)
            }
        }
    }
}
        
        #Preview {
            ContentView()
        }
        
