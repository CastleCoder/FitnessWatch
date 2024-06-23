//
//  FitnessWatchApp.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import SwiftData

@main
struct FitnessWatch_Watch_AppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Series.self)
    }
}
