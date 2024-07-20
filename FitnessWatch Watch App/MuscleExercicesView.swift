//
//  MuscleExercicesView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI

struct MuscleExercicesView: View {
    let exerciceGroup = ExerciceData.muscleGroups
    
    @State var groupName: String
    @AppStorage("ExerciceChoose") private var ExerciceChoose: String = "À choisir"
    
    var body: some View {
        if let group = ExerciceData.muscleGroups.first(where: { $0.name == groupName }) {
            List(group.exercices, id: \.id) { exercice in
                NavigationLink(destination: CurrentInformationsView()) {
                    Text(exercice.name)
                        .onTapGesture {
                            ExerciceChoose = exercice.name
                            print("Selected exercise: \(ExerciceChoose) for muscle group: \(groupName)")

                        }
                }
            }
            .navigationTitle(Text("Exercices pour \(groupName)"))
        } else {
            Text("Aucun exercice trouvé pour \(groupName)")
                .navigationTitle(Text("Erreur"))
        }
    }
}

#Preview {
    MuscleExercicesView(groupName: "Pectoraux")
}
