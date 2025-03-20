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
    
    
    @AppStorage("savedExerciceName") private var savedExerciceName: String = ""
    
    
    @State var groupName: String = "À choisir"
    @State var ExerciceChoose: String = "À choisir"
    
    
    @SceneStorage("WeightChoose") var WeightChoose: Double = 0.0
    @SceneStorage("RepChoose") var RepChoose: Double = 0.0
    @SceneStorage("set") var set: Int = 0
    
    @State private var selectedTab = 1
    @State private var isButtonDisabled = false
    
    @Query var allSeries: [Series]  // toutes les séries enregistrées

    
    
    
    
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
                        .disabled(groupName == "À choisir")
                        
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
                            let currentSet = seriesCountToday()
                            if currentSet <= 1 {
                                Text("\(currentSet) série")
                            } else {
                                Text("\(currentSet) séries")
                            }
                        }
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                            isButtonDisabled = true

                                // Crée la série
                                let newSeries = Series(
                                    date: Date(),
                                    muscle: groupName,
                                    exercise: ExerciceChoose,
                                    weight: Float(WeightChoose),
                                    reps: Float(RepChoose),
                                    sets: set + 1

                                )


                                // 1. Sauvegarde sur la montre
                                context.insert(newSeries)
                            
                            print("📤 Envoi depuis Watch :")
                                print("- muscle: \(groupName)")
                                print("- exercice: \(ExerciceChoose)")
                                print("- poids: \(WeightChoose)")
                                print("- reps: \(RepChoose)")
                                print("- sets: \(set + 1)")


                                // 2. Envoie sur l’iPhone via WatchConnectivity
//                                let dto = SeriesDTO(from: newSeries)
//                                if let data = try? JSONEncoder().encode(dto) {
                            let message: [String: Any] = [
                                    Series.muscleKey: groupName,
                                    Series.exerciceKey: ExerciceChoose,
                                    Series.weightKey: Int(WeightChoose),
                                    Series.repKey: Int(RepChoose),
                                    Series.setsKey: set + 1,
                                    Series.dateKey: Date()
                                ]
                                connectivity.sendNewMessage(message)
//                                }

                                // 3. Incrémentation série
                                set += 1

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isButtonDisabled = false
                                }

                            }) {
                                Text("Valider la série")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .disabled(isButtonDisabled || groupName == "À choisir" || ExerciceChoose == "À choisir")
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
    
    func seriesCountToday() -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return allSeries.filter {
            $0.muscle == groupName &&
            $0.exercise == ExerciceChoose &&
            Calendar.current.isDate($0.date, inSameDayAs: today)
        }.count
    }
    
}





#Preview {
    CurrentInformationsView()
        .environmentObject(DataManager())
}
