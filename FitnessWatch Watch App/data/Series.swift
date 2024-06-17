//
//  Series.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 10/06/2024.
//

import Foundation
import SwiftUI

struct Series: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var muscle: String
    var exercise: String
    var weight: Float
    var reps: Float
    var sets: Int

    // Initialisateur personnalisé
    init(id: UUID = UUID(), date: Date, muscle: String, exercise: String, weight: Float, reps: Float, sets: Int) {
        self.id = id
        self.date = date
        self.muscle = muscle
        self.exercise = exercise
        self.weight = weight
        self.reps = reps
        self.sets = sets
    }
}

// #Preview {
//     // Vous ne pouvez pas prévisualiser des objets non SwiftUI ici
//     // Series(date: Date(), muscle: "Pectoraux", exercise: "Bench Press", weight: 100, reps: 10, sets: 3)
// }
