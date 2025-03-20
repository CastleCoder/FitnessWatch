//
//  LiquidGlassButton.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 21/08/2025.
//

import SwiftUI

struct LiquidGlassButton: View {
    var title: String
    
    var body: some View {
        ZStack {
            // Fond blanc
            Capsule()
                .fill(Color.white)
            
            // Texte orange + pastille de verre
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
                .padding()
                .frame(maxWidth: .infinity)
                .clipShape(Capsule())
                .background(
                    Capsule()
                        .fill(.ultraThinMaterial) // effet vitre givrée
                )
        }
        .frame(height: 50)
        .shadow(radius: 5) // ombre légère
    }
}
