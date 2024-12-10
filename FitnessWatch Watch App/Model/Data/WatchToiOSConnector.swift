//
//  WatchToiOSConnector.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 08/11/2024.
//

import Foundation
import WatchConnectivity

class WatchToiOSConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = selfsession.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sendMacroToiOS(macro: Macro) {
        if session.isReachable {
            
        } else {
            print("session is not reachable")
        }
    }
}
