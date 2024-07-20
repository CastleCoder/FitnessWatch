//
//  MusclesGroup.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI


struct MusclesView: View {
    
    let muscleGroup = ExerciceData.muscleGroups
    @AppStorage("groupName") private var groupName = "Pectoraux"
    
    var body: some View {
        NavigationStack {
            List(muscleGroup, id: \.name) { group in
                NavigationLink(destination: MuscleExercicesView(groupName: group.name)) {
                    Text(group.name)
                        .onTapGesture {
                            groupName = group.name
                        }
                }
            }
            
        }
    }
}


#Preview {
    MusclesView()
}
