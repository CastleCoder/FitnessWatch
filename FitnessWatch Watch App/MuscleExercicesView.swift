//
//  MuscleExercicesView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/05/2024.
//

import SwiftUI


struct MuscleExercicesView: View {
    
    let groupName: String
    
    var body: some View {
        Text("Exercices pour \(groupName)")
        
    }
}

#Preview {
    MuscleExercicesView(groupName: "Pectoraux")
}
