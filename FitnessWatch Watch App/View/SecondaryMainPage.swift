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
            NavigationView {
                VStack(spacing: 20) {
                    //Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: MusclesView()) {
                            Text("Stop")
                                .padding()
                                .background(Circle().fill(Color.black))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.orange, lineWidth: 4)
                                        .frame(width: 80.0, height: 80.0)
                                    
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        Spacer()
                    }
                    //Spacer()
                    .padding(.bottom, 10)
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: HistoricalView()) {
                            Text("Historique")
                                .padding()
                                .background(Circle().fill(Color.black))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.orange, lineWidth: 4)
                                        .frame(width: 80.0, height: 80.0)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        Spacer()
                        NavigationLink(destination: AllTimers()) {
                            Image(systemName: "timer")
                                .resizable()
                                .padding()
                                .frame(width: 60.0, height: 60.0)
                                .background(Circle().fill(Color.black))
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.orange, lineWidth: 4)
                                        .frame(width: 80.0, height: 80.0)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(10)
                        Spacer()
                    }
                    Spacer()
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
