//
//  ContinuedView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 15/05/2024.
//

import SwiftUI

struct ContinuedView: View {
    var body: some View {
        Text("Voulez-vous refaire une série ?")
            .multilineTextAlignment(.center)
            .padding()
        NavigationView{
            
            HStack(alignment: .center) {
                NavigationLink(destination: ChooseWeight()) {
                    Text("Oui")
                        .frame(width: 60, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())


                Spacer()
                    .frame(width: 30.0)
                
                NavigationLink(destination: MusclesView()) {
                    Text("Non")
                        .frame(width: 60, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                }
                .buttonStyle(PlainButtonStyle())
  
            }
        }
        
    }
}

#Preview {
    ContinuedView()
}
