//
//  HistoricalView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/06/2024.
//

import SwiftUI

struct HistoricalView: View {
    @State var ExerciceChoose : String
    @State var MuscleChoose : String
    @State var WeightChoose : Int
    @State var RepChoose : Int
    @State var set: Int = 0
    
    
    
    var body: some View {
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
                Text("\(WeightChoose) KG")
            }
            HStack {
                Text("Répétitions:")
                Spacer()
                Text("\(RepChoose) REP")
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
        .padding()
    }
}

#Preview {
    HistoricalView(ExerciceChoose:"DC", MuscleChoose: "Pectoraux", WeightChoose: 100, RepChoose: 10)
}
