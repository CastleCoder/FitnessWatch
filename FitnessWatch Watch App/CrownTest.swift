//
//  CrownTest.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 12/04/2024.
//

import SwiftUI
import WatchKit

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var numberLabel: WKInterfaceLabel!
    
    var selectedNumber: Int = 0
    
    @IBAction func crownDidRotate(_ sender: WKInterfacePicker, value: Int) {
        selectedNumber = value
        numberLabel.setText("\(selectedNumber)")
    }
}

struct SwiftUIView: View {
    
    @State private var counterValue: Int = 0 // Utilise @State pour rendre la variable modifiable
    
    var body: some View {
        VStack {
            Text("Poids en KG") // Affiche la valeur actuelle du compteur
                .padding()
            
            Picker(selection: $counterValue, label: Text("")) { // Utilise un Picker SwiftUI pour afficher le compteur
                ForEach(0..<150) { index in // Par exemple, vous pouvez définir un intervalle de 0 à 99
                    Text("\(index)")
                }
            }
            .pickerStyle(WheelPickerStyle()) // Utilise un style de Picker de type roue pour simuler une roulette
            .frame(width: 100) // Définissez une largeur fixe pour le Picker pour s'assurer qu'il est bien visible
        }
    }
}

#Preview {
    SwiftUIView()
}
