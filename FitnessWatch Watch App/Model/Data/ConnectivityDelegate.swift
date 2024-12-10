//
//  ConnectivityDelegate.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 10/12/2024.
//

import Foundation
import WatchConnectivity
import SwiftData

extension Connectivity: WCSessionDelegate {
    
    //MessageRecu
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let muscle = message[Series.muscleKey] as? String {
                print("Muscle reçu : \(muscle)")
                self.receivedMuscle = muscle // Met à jour la propriété dédiée
            }
        }
    }

    
    //Session Activée
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { print("Did Complete")}
    
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {session.activate()}
    #endif
    
}
