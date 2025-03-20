//
//  SecondaryMainPage.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 04/06/2024.
//

import SwiftUI

struct SecondaryMainPage: View {
    
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack(spacing: 10) {
                    NavigationLink(destination: HistoricalView()) {
                        Image(systemName: "calendar")
                            .resizable()
                            .padding()
                            .frame(width: 55.0, height: 55.0)
                            .background(Circle().fill(Color.black))
                            
                        Text("Historique")

                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 30.0)
                            .strokeBorder(Color.orange, lineWidth: 4)
                            .frame(width: 170.0, height: 70.0)
                    )
                    .buttonStyle(PlainButtonStyle())
                    .padding(10)
//                        Spacer
                        
//                        Spacer()
                    NavigationLink(destination: TabMainView(selectedTab: 2 )) {
                            Image(systemName: "timer")
                                .resizable()
                                .padding()
                                .frame(width: 60.0, height: 60.0)
                                .background(Circle().fill(Color.black))
                                
                            Text("Timers")

                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 30.0)
                                .strokeBorder(Color.orange, lineWidth: 4)
                                .frame(width: 170.0, height: 70.0)
                        )
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        Spacer()
//                    }
//                    Spacer()
                }
                .padding(.top, 45)
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SecondaryMainPage()
}
