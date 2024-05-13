//
//  MuscleExercicesView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI

var muscle: MuscleGroup

struct MuscleExercicesView: View {
    var body: some View {
        List(muscle.exercices, id: \.name) { exercice in
            Text(exercice.name)
        }
    }
}

#Preview {
    MuscleExercicesView()
}
