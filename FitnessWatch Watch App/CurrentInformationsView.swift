//
//  CurrentInformationsView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/06/2024.
//

import SwiftUI

struct CurrentInformationsView: View {
    @State var ExerciceChoose : String = "À choisir"
    @State var MuscleChoose : String = "À choisir"
    @State var WeightChoose : Float
    @State var RepChoose : Float
    @State var set: Int = 0
    

    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack {
                    Text("Muscle:")
                    Spacer()
                    Text(MuscleChoose)
                }
                
                HStack {
                    Text("Exercise:")
                    Spacer()
                    Text(ExerciceChoose)
                }
                HStack {
                    Text("Poids:")
                    Spacer()
                    // Display the weight and make it focusable for the crown
                    Text("\(String(format: "%.0f", WeightChoose)) KG")
                        .focusable(true)
                        .digitalCrownRotation($WeightChoose, from: 0.0, through: 100.0, by: 1.0, sensitivity: .medium)
                }
                HStack {
                    Text("Répétitions:")
                    Spacer()
                    // Display the repetitions and make it focusable for the crown
                    Text("\(String(format: "%.0f", RepChoose)) REP")
                        .focusable(true)
                        .digitalCrownRotation($RepChoose, from: 0.0, through: 100.0, by: 1.0, sensitivity: .low)
                }
                HStack {
                    Text("N° de Série:")
                    Spacer()
                    if set <= 1 {
                        Text("\(set) série")
                    } else {
                        Text("\(set) séries")
                    }
                }
                Spacer()
                
                Button(action: {
                    set += 1
                }) {
                    Text("Validé la série")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top, 30)
            .padding(.horizontal, 5)
        }
    }
}

#Preview {
    CurrentInformationsView(WeightChoose: 100, RepChoose: 10)
}
