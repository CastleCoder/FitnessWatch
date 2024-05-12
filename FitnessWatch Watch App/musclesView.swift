//
//  MusclesGroup.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI

struct MusclesView: View {
    
    let muscleGroups = ExerciceData.muscleGroups
    
    var body: some View {
        List(muscleGroups, id: \.id) { muscle in
            Text(muscle.name)
        }
    }
}


#Preview {
    MusclesView()
}
