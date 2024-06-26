//
//  TabMainView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 04/06/2024.
//

import SwiftUI

struct TabMainView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SecondaryMainPage()
                .tag(0)
            
            CurrentInformationsView(ExerciceChoose: "À choisir", groupName: "À choisir")
                .tag(1)
            
            AllTimers()
                .tag(2)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabMainView()
}
