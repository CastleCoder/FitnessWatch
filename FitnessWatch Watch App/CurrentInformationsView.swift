//
//  CurrentInformationsView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/06/2024.
//

import SwiftUI

struct CurrentInformationsView: View {
    
    @EnvironmentObject var dataManager: DataManager

    @State var ExerciceChoose : String
    @State var WeightChoose : Float = 0
    @State var RepChoose : Float = 0
    @State var set: Int = 0
    
    @State var groupName: String
    @State private var selectedTab = 1

    
    
    
    
    var body: some View {
        TabView(selection: $selectedTab) {

            SecondaryMainPage()
                .tag(0)
            
            ScrollView {
                VStack(spacing: 10) {
                    HStack {
                        Text("Muscle:")
                        Spacer()
                        NavigationLink(destination: MusclesView()) {                    Text(groupName)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    HStack {
                        Text("Exercise:")
                        Spacer()
                        NavigationLink(destination: MuscleExercicesView(groupName: groupName, ExerciceChoose: $ExerciceChoose)) {
                            Text(ExerciceChoose)
                        }
                        .buttonStyle(PlainButtonStyle())
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
                        let newSeries = Series(date: Date(), muscle: groupName, exercise: ExerciceChoose, weight: WeightChoose, reps: RepChoose, sets: set)
                        dataManager.seriesList.append(newSeries)
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
            .tag(1)
            
            AllTimers()
                .tag(2)
        }
    }
}

#Preview {
    CurrentInformationsView(ExerciceChoose: "À choisir" ,groupName: "À choisir" )
        .environmentObject(DataManager())
}
