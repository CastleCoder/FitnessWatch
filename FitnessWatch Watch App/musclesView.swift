//
//  MusclesGroup.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI


struct MusclesView: View {
        
    
    let muscleGroup = ExerciceData.muscleGroups
    
    var body: some View {
        NavigationStack {
            List(muscleGroup, id: \.name) { group in
                NavigationLink(destination: MuscleExercicesView(groupName: group.name, ExerciceChoose: .constant("À choisir"))) {
                    Text(group.name)
                }
            }
           
        }
    }
}


#Preview {
    MusclesView()
}
