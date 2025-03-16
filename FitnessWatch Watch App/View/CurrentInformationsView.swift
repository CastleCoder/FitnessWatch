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
    @ObservedObject var connectivity: Connectivity = Connectivity.shared
    
    //    @AppStorage("savedGroupName") private var savedGroupName: String = ""
    @AppStorage("savedExerciceName") private var savedExerciceName: String = ""
    
    
    @State var groupName: String = "À choisir"
    @State var ExerciceChoose: String = "À choisir"
    
    
    @SceneStorage("WeightChoose") var WeightChoose: Double = 0.0
    @SceneStorage("RepChoose") var RepChoose: Double = 0.0
    @SceneStorage("set") var set: Int = 0
    
    @State private var selectedTab = 1
    
    
    
    
    
    var body: some View {
        NavigationStack {
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
                        //                        .onAppear {
                        //                            savedGroupName = groupName
                        //                        }
                        HStack {
                            Text("Exercise:")
                            Spacer()
                            NavigationLink(destination: MuscleExercicesView(groupName: groupName, ExerciceChoose: ExerciceChoose)) {
                                Text(ExerciceChoose)
                            }
                            .onAppear {
                                savedExerciceName = ExerciceChoose
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        HStack {
                            Text("Poids:")
                            Spacer()
                            
                            Text("\(String(format: "%.0f", WeightChoose)) KG")
                                .focusable()
                            
                                .digitalCrownRotation($WeightChoose, from: 0.0, through: 300.0, by: 1.0, sensitivity: .medium)
                            
                        }
                        HStack {
                            Text("Répétitions:")
                            Spacer()
                            
                            Text("\(String(format: "%.0f", RepChoose)) REP")
                                .focusable()
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
                            


                            
                            dataManager.addSeries(
                                muscle: groupName,
                                exercise: ExerciceChoose,
                                weight: Float(WeightChoose),
                                reps: Float(RepChoose),
                                sets: set,
                                context: context
                                
                            )
                            connectivity.sendNewMessage([Series.muscleKey: groupName,
                                                         Series.exerciceKey: ExerciceChoose,
                                                         Series.weightKey: WeightChoose,
                                                         Series.repKey: RepChoose,
                                                         Series.setsKey: set+1,
                                                         Series.dateKey: Date()
                                                        ])
                            
                           
                            
                            set += 1 // Incrémente 'set' après l'envoi
                            print("\(groupName) & \(ExerciceChoose)")
                        }) {
                            Text("Valider la série")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .disabled(groupName == "À choisir" || ExerciceChoose == "À choisir")
                        .buttonStyle(PlainButtonStyle())
                        
                        
                    }
                    
                    .onChange(of: savedExerciceName) {
                        set = 0
                        RepChoose = 0
                        WeightChoose = 0
                        
                    }
                    
                    .padding(.top, 30)
                    .padding(.horizontal, 5)
                }
                .tag(1)
                
                Chronometer()
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
