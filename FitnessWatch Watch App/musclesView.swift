//
//  MusclesGroup.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI


struct MusclesView: View {
    
    let muscleGroup = ExerciceData.muscleGroups
    //let exerciceMuscles = ExerciceData.
    
    var body: some View {
        NavigationView {
            List(muscleGroup, id: \.name) { muscle in
                NavigationLink(destination: MuscleExercicesView(muscle: muscle))
                Text(muscle.name)
            }
        }
    }
}


#Preview {
    MusclesView()
}
