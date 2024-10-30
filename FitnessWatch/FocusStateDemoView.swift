//
//  FocusStateDemoView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 24/10/2024.
//


//
//  FocusStateDemoView.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 23/10/2024.
//
import SwiftUI

struct FocusStateDemoView: View {
    
    @SceneStorage("WeightChoose") var WeightChoose: Int = 1
    @FocusState private var isWeightActive: Bool

    var body: some View {
        HStack {
            Text("Poids:")
            Spacer()
            TextField("Poids", value: $WeightChoose, formatter: NumberFormatter()) // Utilisation d'un TextField
                .keyboardType(.numberPad) // Clavier numérique si supporté
                .focused($isWeightActive) // Utilisation du FocusState pour gérer le focus
                .foregroundColor(isWeightActive ? .green : .yellow)
                .animation(.easeIn(duration: 1), value: WeightChoose)
            Button("Focus sur le champ Poids") {
                            isWeightActive = true // Met le TextField en focus manuellement
                        }
        }
        
        .padding()
    }
}

struct FocusStateDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateDemoView()
    }
}
