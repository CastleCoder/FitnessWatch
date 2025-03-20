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
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            print("📥 iPhone a reçu un message ! \(message)")

            if let context = self.modelContext, // important
               let muscle = message["muscle"] as? String,
               let exercice = message["exercice"] as? String,
               let weight = message["weight"] as? Int,
               let rep = message["rep"] as? Int,
               let set = message["set"] as? Int,
               let date = message["date"] as? Date ?? (message["date"] as? String).flatMap({ ISO8601DateFormatter().date(from: $0) }) {

                let newSeries = Series(
                    date: date,
                    muscle: muscle,
                    exercise: exercice,
                    weight: Float(weight),
                    reps: Float(rep),
                    sets: set
                )

                context.insert(newSeries)

                print("✅ Série insérée sur iPhone : \(newSeries.muscle) - \(newSeries.exercise)")
            } else {
                print("⚠️ Échec parsing ou modelContext nil")
            }
        }
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any]) {
        print("Données reçues :", userInfo)
        // → Tu peux les stocker ici
    }
    
    
    
    
    //Session Activée
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { print("Did Complete")}
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {session.activate()}
#endif
    
}
