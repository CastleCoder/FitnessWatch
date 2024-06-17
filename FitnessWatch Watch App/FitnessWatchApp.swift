//
//  FitnessWatchApp.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI

@main
struct FitnessWatch_Watch_AppApp: App {
    @StateObject private var dataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    NavigationLink(destination: CurrentInformationsView(ExerciceChoose: "À choisir", groupName: "hello").environmentObject(dataManager)) {
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
}
