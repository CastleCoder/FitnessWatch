//
//  AllTimersView.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 21/05/2024.
//

import SwiftUI

struct AllTimersView: View {
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                VStack {
                    Spacer()

                    NavigationLink(destination: TimerOne()) {
                        VStack {
                            Text("60")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("s")
                                .font(.title3)
                                .foregroundColor(.orange)
                        }
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
                    
                   // Spacer()
                    NavigationLink(destination: TimerTwo()) {
                        VStack {
                            Text("90")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("s")
                                .font(.title3)
                                .foregroundColor(.orange)
                        }
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

                    NavigationLink(destination: TimerThree()) {
                        VStack {
                            Text("120")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("s")
                                .font(.title3)
                                .foregroundColor(.orange)
                        }
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
                    NavigationLink(destination: TimerFour()) {
                        VStack {
                            Text("160")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("s")
                                .font(.title3)
                                .foregroundColor(.orange)
                        }
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
            }
            .padding(.top, 45)
            .edgesIgnoringSafeArea(.bottom)
            //.navigationTitle(Text("Compte à rebours"))
        }
    }
}

#Preview {
    AllTimersView()
}
