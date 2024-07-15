//
//  CurrentSession.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 15/07/2024.
//

import SwiftData
import SwiftUI

@Model
class CurrentSession: ObservableObject {
    @Attribute var groupName: String
    @Attribute var ExerciceChoose: String
    //@Attribute var WeightChoose: Float
    //@Attribute var RepChoose: Float
    //@Attribute var set: Int

    init(groupName: String = "À choisir", ExerciceChoose: String = "À choisir"/*, WeightChoose: Float = 0.0, RepChoose: Float = 0.0, set: Int = 0*/) {
        self.groupName = groupName
        self.ExerciceChoose = ExerciceChoose
        //self.WeightChoose = WeightChoose
        //self.RepChoose = RepChoose
       // self.set = set
    }
}
