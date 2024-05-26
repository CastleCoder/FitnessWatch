//
//  MainView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 26/05/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    NavigationLink(destination: MusclesView()) {
                        Text("Exercices")
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
                    NavigationLink(destination: ChooseWeight()) {
                        Text("Weight")
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
                Spacer()
                VStack {
                    Spacer()
                    NavigationLink(destination: RepetitionsNumbers()) {
                        Text("Rep")
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
                    //Spacer()
                    NavigationLink(destination: AllTimers()) {
                        Image(systemName: "timer")
                            .resizable()
                            .padding()
                            .frame(width: 50.0, height: 50.0)
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
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
