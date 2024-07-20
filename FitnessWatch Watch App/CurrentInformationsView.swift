//
//  CurrentInformationsView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/06/2024.
//

import SwiftUI
import SwiftData

struct CurrentInformationsView: View {
    
    
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.modelContext) private var context
    
    @AppStorage("groupName") private var groupName = "Pectoraux"
    @AppStorage("ExerciceChoose") private var ExerciceChoose: String = "À choisir"
    
    @SceneStorage("WeightChoose") var WeightChoose: Double = 0.0
    @SceneStorage("RepChoose") var RepChoose: Double = 0.0
    @SceneStorage("set") var set: Int = 0
    
    @State private var selectedTab = 1
    @State private var isWeightActive = false
    @State private var isRepActive = false
    
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                
                SecondaryMainPage()
                    .tag(0)
                
                ScrollView {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Muscle:")
                            Spacer()
                            NavigationLink(destination: MusclesView()) {
                                Text(groupName)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        HStack {
                            Text("Exercise:")
                            Spacer()
                            NavigationLink(destination: MuscleExercicesView(groupName: groupName)) {
                                Text(ExerciceChoose)
                            }
                            
                            .buttonStyle(PlainButtonStyle())
                        }
                        HStack {
                            Text("Poids:")
                            Spacer()
                            // Display the weight and make it focusable for the crown
                            Text("\(String(format: "%.0f", WeightChoose)) KG")
                                .foregroundColor(isWeightActive ? .green : .white)
                                .focusable(true) { focused in
                                    isWeightActive = focused
                                }
                                .digitalCrownRotation($WeightChoose, from: 0.0, through: 300.0, by: 1.0, sensitivity: .medium)
                                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 1), value: isWeightActive)
                            
                        }
                        HStack {
                            Text("Répétitions:")
                            Spacer()
                            // Display the repetitions and make it focusable for the crown
                            Text("\(String(format: "%.0f", RepChoose)) REP")
                                .foregroundColor(isRepActive ? .green : .white)
                                .focusable(true) { focused in
                                    isRepActive = focused
                                }
                                .digitalCrownRotation($RepChoose, from: 0.0, through: 100.0, by: 1.0, sensitivity: .low)
                                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 1), value: isRepActive)
                            
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
                            dataManager.addSeries(muscle: groupName, exercise: ExerciceChoose, weight: Float(WeightChoose), reps: Float(RepChoose), sets: set, context: context)
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
                    .onChange(of: ExerciceChoose, initial: false) {
                        set = 0
                        RepChoose = 0
                        WeightChoose = 0
                    }
                    
                    .padding(.top, 30)
                    .padding(.horizontal, 5)
                }
                .tag(1)
                
                AllTimers()
                    .tag(2)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CurrentInformationsView()
        .environmentObject(DataManager())
}
