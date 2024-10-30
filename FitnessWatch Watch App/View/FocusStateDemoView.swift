//
//  FocusStateDemoView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 23/10/2024.
//
import SwiftUI

struct FocusStateDemoView: View {
    

    
    @State private var ValueToChange: Double = 0.0
    
    var body: some View {
        HStack {
            Text("Poids:")
            Spacer()
            Text("\(String(format: "%.0f", ValueToChange)) KG")
                .focusable()
                .digitalCrownRotation($ValueToChange)
        }
        .padding()
    }
}

struct FocusStateDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateDemoView()
    }
}
