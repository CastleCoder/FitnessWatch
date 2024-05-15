//
//  MuscleExercicesView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI


struct MuscleExercicesView: View {
    
    let exerciceGroup = ExerciceData.muscleGroups
    
    let groupName: String
    
    var body: some View {
        if let group = ExerciceData.muscleGroups.first(where: { $0.name == groupName }) {
                    List(group.exercices, id: \.id) { exercice in
                        NavigationLink(exercice.name, destination: ChooseWeight())
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
