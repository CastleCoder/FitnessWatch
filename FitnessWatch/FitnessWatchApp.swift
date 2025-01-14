//
//  FitnessWatchApp.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import SwiftData



@main
struct MyApp: App {
    
    
    @StateObject private var dataManager = DataManager()


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Series.self)
    }
}
