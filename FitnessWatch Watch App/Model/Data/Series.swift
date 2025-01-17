//
//  Series.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 10/06/2024.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class Series: Identifiable {
    static let muscleKey = "muscle"
    static let dateKey = "date"
    static let exerciceKey = "exercice"
    static let weightKey = "weight"
    static let repKey = "rep"
    static let setsKey = "set"


    var id: String
    var date: Date
    var muscle: String
    var exercise: String
    var weight: Float
    var reps: Float
    var sets: Int

    init(date: Date, muscle: String, exercise: String, weight: Float, reps: Float, sets: Int) {
        self.id = UUID().uuidString
        self.date = date
        self.muscle = muscle
        self.exercise = exercise
        self.weight = weight
        self.reps = reps
        self.sets = sets
    }
}





