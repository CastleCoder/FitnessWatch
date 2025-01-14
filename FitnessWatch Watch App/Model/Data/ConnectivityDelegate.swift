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
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let muscle = message["muscle"] as? String {
                self.receivedMuscle = muscle
            }
            if let exercice = message["exercice"] as? String {
                self.receivedExercice = exercice
            }
            if let rep = message["rep"] as? Int {
                self.receivedRep = rep
            }
            if let weight = message["weight"] as? Int {
                self.receivedWeight = weight
            }
            if let set = message["set"] as? Int {
                self.receivedSet = set
            }
            if let date = message[Series.dateKey] as? Date {
                self.receivedDate = date // Assurez-vous d'avoir une propriété `receivedDate`
            } else if let dateString = message[Series.dateKey] as? String,
                      let parsedDate = ISO8601DateFormatter().date(from: dateString) {
                self.receivedDate = parsedDate
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
