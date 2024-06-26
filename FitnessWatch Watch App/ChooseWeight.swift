//
//  ChooseWeight.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 15/05/2024.
//

import SwiftUI

struct ChooseWeight: View {
    @State private var selectedNumber = 0
        let numbers = Array(0...100)
        
        var body: some View {
            VStack {
                        Text("Poids: \(selectedNumber) KG")
                            .padding()
                        Picker("", selection: $selectedNumber) {
                            ForEach(numbers, id: \.self) { number in
                                Text("\(number) KG").tag(number)
                            }
                        }
                        .frame(height: 100.0)
                        .pickerStyle(WheelPickerStyle())
                        
                        NavigationLink(destination: MainView()) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                            //.foregroundColor(.white)
                            //.background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.top, 10)
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    .padding(.top, 20)
                    .navigationTitle("")
        }
}

#Preview {
    ChooseWeight()
}
