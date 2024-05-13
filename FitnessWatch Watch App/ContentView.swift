//
//  ContentView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: MusclesView()){
                Text("Commencer la séance")
            }
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

