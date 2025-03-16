////
////  AllTimersView.swift
////  FitnessWatch Watch App
////
////  Created by Cyrille Chateau on 21/05/2024.
////
//
//import SwiftUI
//
//struct AllTimersView: View {
//    
//    @State var selectedCountdown: Int = 60
//    let countdownOptions = [60, 90, 120, 150]
//    
//    enum TimerDestination {
//        case timerOne
//        case timerTwo
//        case timerThree
//        case timerFour
//        
//        init(value: Int) {
//            switch value {
//            case 60:
//                self = .timerOne
//            case 90:
//                self = .timerTwo
//            case 120:
//                self = .timerThree
//            case 150:
//                self = .timerFour
//            default:
//                self = .timerOne
//            }
//        }
//        
//        // Fonction pour retourner la vue associée
//        @ViewBuilder
//        func destinationView() -> some View {
//            switch self {
//            case .timerOne:
//                TimerOne()
//            case .timerTwo:
//                TimerTwo()
//            case .timerThree:
//                TimerThree()
//            case .timerFour:
//                TimerFour()
//            }
//        }
//    }
//    
//    var body: some View {
//        
//        NavigationStack {
//            VStack {
//                Text("Compte à rebours")
//                    .font(.headline)
////                    .padding(.bottom, 10)
//                    .foregroundColor(.red)
//                    .multilineTextAlignment(.center)
//                    .lineLimit(2)
//                
////                Text("\(selectedCountdown) s")
////                    .font(.headline)
////                    .padding(.bottom, 10)
////                    .foregroundColor(.red)
//                
//                
//                Picker("Choisir compte à rebours", selection: $selectedCountdown) {
//                    ForEach(countdownOptions, id: \.self) { countdownOption in
//                        Text("\(countdownOption) s")
//                    }
//                }
//                .frame(height: 50.0)
//                .font(.headline)
//                .padding(.vertical, 10.0)
//                .pickerStyle(.wheel)
//                .lineLimit(nil)
//
//                
//                
//                NavigationLink(destination: TimerDestination(value: selectedCountdown).destinationView()) {
//                                    Text("Commencer")
//                        .font(.body)
//                                        .foregroundColor(.white)
//                                }
//            }
//            .padding(10)
//        }
//        
//        //        @ViewBuilder
//        //        func destinationCountdown(for countdown: Int) -> some View {
//        //            switch countdown {
//        //            case 60:
//        //                TimerOne(countdown: selectedCountdown)
//        //            case 90:
//        //                TimerTwo(countdown: selectedCountdown)
//        //            case 120:
//        //                TimerThree(countdown: selectedCountdown)
//        //            case 150:
//        //                TimerFour(countdown: selectedCountdown)
//        //            }
//        //        }
//        
//        /* NavigationView {
//         HStack {
//         Spacer()
//         VStack {
//         Spacer()
//         
//         NavigationLink(destination: TimerOne()) {
//         VStack {
//         Text("60")
//         .font(.title2)
//         .foregroundColor(.white)
//         Text("s")
//         .font(.title3)
//         .foregroundColor(.orange)
//         }
//         .padding()
//         .background(Circle().fill(Color.black))
//         .overlay(
//         Circle()
//         .strokeBorder(Color.orange, lineWidth: 4)
//         .frame(width: 80.0, height: 80.0)
//         
//         )
//         }
//         .buttonStyle(PlainButtonStyle())
//         .padding(10)
//         
//         // Spacer()
//         NavigationLink(destination: TimerThree()) {
//         VStack {
//         Text("120")
//         .font(.title2)
//         .foregroundColor(.white)
//         Text("s")
//         .font(.title3)
//         .foregroundColor(.orange)
//         }
//         .padding()
//         .background(Circle().fill(Color.black))
//         .overlay(
//         Circle()
//         .strokeBorder(Color.orange, lineWidth: 4)
//         .frame(width: 80.0, height: 80.0)
//         
//         )
//         }
//         .buttonStyle(PlainButtonStyle())
//         .padding(10)
//         Spacer()
//         
//         }
//         Spacer()
//         VStack {
//         Spacer()
//         
//         NavigationLink(destination: TimerTwo()) {
//         VStack {
//         Text("90")
//         .font(.title2)
//         .foregroundColor(.white)
//         Text("s")
//         .font(.title3)
//         .foregroundColor(.orange)
//         }
//         .padding()
//         .background(Circle().fill(Color.black))
//         .overlay(
//         Circle()
//         .strokeBorder(Color.orange, lineWidth: 4)
//         .frame(width: 80.0, height: 80.0)
//         
//         )
//         }
//         .buttonStyle(PlainButtonStyle())
//         .padding(10)
//         //Spacer()
//         NavigationLink(destination: TimerFour()) {
//         VStack {
//         Text("150")
//         .font(.title2)
//         .foregroundColor(.white)
//         Text("s")
//         .font(.title3)
//         .foregroundColor(.orange)
//         }
//         .padding()
//         .background(Circle().fill(Color.black))
//         .overlay(
//         Circle()
//         .strokeBorder(Color.orange, lineWidth: 4)
//         .frame(width: 80.0, height: 80.0)
//         
//         )
//         }
//         .buttonStyle(PlainButtonStyle())
//         .padding(10)
//         Spacer()
//         
//         }
//         Spacer()
//         }
//         .padding()
//         //.navigationTitle(Text("Compte à rebours"))
//         }*/
//    }
//}
//
//#Preview {
//    AllTimersView()
//}
