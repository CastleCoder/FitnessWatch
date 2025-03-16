//
//  TabMainView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 04/06/2024.
//

import SwiftUI

struct TabMainView: View {
    @State var selectedTab: Int = 1
    var body: some View {
        
        TabView(selection: $selectedTab) {
            SecondaryMainPage()
                .tag(0)
            
            CurrentInformationsView()
                .tag(1)
            
            Chronometer()
                .tag(2)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TabMainView(selectedTab: 1)
}
