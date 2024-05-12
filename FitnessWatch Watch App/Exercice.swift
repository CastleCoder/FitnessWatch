//
//  Exercice.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 11/05/2024.
//

import SwiftUI

struct Exercice: View {
    var body: some View {
        VStack {
            
            NavigationView {
                List {
                    Section(header: Text("Pectoraux")) {
                        ForEach(chestExercices, id: \.self) { exercice in
                            NavigationLink(destination: WeightView(exerciceName: exercice.name))
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                    Section(header: Text("Dos")) {
                        ForEach(backExercices, id: \.self) { exercice in
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                    Section(header: Text("Jambes")) {
                        ForEach(legsExercices, id: \.self) { exercice in
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                    Section(header: Text("Épaules")) {
                        ForEach(shouldersExercices, id: \.self) { exercice in
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                    Section(header: Text("Bras")) {
                        ForEach(armExercices, id: \.self) { exercice in
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                    Section(header: Text("Abdominaux")) {
                        ForEach(absExercices, id: \.self) { exercice in
                            Text(exercice)
                                .font(.caption)
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)


        
        /*HStack(alignment: .bottom) {
            Spacer()
           // NavigationStack {
                NavigationLink(destination: WeightView()) {
                    Image(systemName: "checkmark")
                    
                }
                .frame(width: 20.0, height: 20)
                .navigationBarBackButtonHidden(true)
                
            //}
           // .frame(width: 68.0, height: 68)

            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .offset(y: 25)*/


    }
}

#Preview {
    Exercice()
}
