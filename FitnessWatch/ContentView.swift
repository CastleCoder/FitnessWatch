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


    var body: some View {
        Text("hello")
        Text("\(connectivity.receivedMuscle ?? "no muscle")")
    }
}





#Preview {
    ContentView()
}
