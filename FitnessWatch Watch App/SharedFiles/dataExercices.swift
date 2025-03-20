//
//  dataexercices.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 11/05/2024.
//

import Foundation

struct Exercice: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

struct MuscleGroup {
    let name: String
    let exercices: [Exercice]
    
    init(name: String, exercices: [Exercice]) {
        self.name = name
        self.exercices = exercices
    }
}

struct ExerciceData {
    // Exercices pour les Pectoraux
    static let chestExercices: [Exercice] = [
        "DC",
        "DCH",
        "DC barre guidée",
        "DI",
        "DIH",
        "Hammer Strenght",
        "DI barre guidée",
        "Écartés (poulis)",
        "Écartés (haltères)"
    ].map { Exercice(name: $0) }

    // Exercices pour le Dos
    static let backExercices: [Exercice] = [
        "Deadlift Sumo",
        "Deadlift Roumain",
        "Rowing barre",
        "Rowing haltère",
        "Tirage Hor.",
        "Tirage Vert.",
        "Good Morning",
        "Lombaires"
    ].map { Exercice(name: $0) }

    // Exercices pour les Jambes
    static let legsExercices: [Exercice] = [
        "Squat",
        "Squat guidée",
        "Hack Squat",
        "Leg Extension",
        "Leg Curl",
        "Presse Horizontale",
        "Presse inclinée",
        "Mollets"
    ].map { Exercice(name: $0) }

    // Exercices pour les Épaules
    static let shouldersExercices: [Exercice] = [
        "Elevations Latérales",
        "Elevations Frontales",
        "Developpé Militaire",
        "Tirage poulis haute",
        "PecDeck"
    ].map { Exercice(name: $0) }

    // Exercices pour les Bras
    static let armExercices: [Exercice] = [
        "Curl haltères",
        "Curl barre",
        "Curl incliné",
        "Curl marteau",
        "Poulis basse",
        "Developpé couché prise serrée",
        "Dips",
        "Poulis haute",
        "Extension haltère",
        "Extension machine",
        "Kick back"
    ].map { Exercice(name: $0) }

    // Exercices pour les Abdominaux
    static let absExercices: [Exercice] = [
        "Crunch sur tapis",
        "Crunch haut machine",
        "Crunch complet machine",
        "Relevé de jambes allongé",
        "Relevé de jambes suspendu"
    ].map { Exercice(name: $0) }

    // Groupes musculaires avec leurs exercices correspondants
    static let muscleGroups: [MuscleGroup] = [
        MuscleGroup(name: "Pectoraux", exercices: chestExercices),
        MuscleGroup(name: "Dos", exercices: backExercices),
        MuscleGroup(name: "Jambes", exercices: legsExercices),
        MuscleGroup(name: "Épaules", exercices: shouldersExercices),
        MuscleGroup(name: "Bras", exercices: armExercices),
        MuscleGroup(name: "Abdominaux", exercices: absExercices)
    ]
}
