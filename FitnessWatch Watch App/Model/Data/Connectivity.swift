//
//  Connectivity.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 08/12/2024.
//

import Foundation
import WatchConnectivity

class Connectivity: NSObject, ObservableObject {
    
    static let shared = Connectivity()
    let messageKey = "Hello"
    @Published var message: Series? = nil
    @Published var receivedMuscle: String? = nil
    
    override init() {
        super.init()
        //Est-ce que WCSession est supporté
        activateConnectivity()
    }
    
    func activateConnectivity() {
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func sendNewMessage(_ message: [String: Any]) {
        guard WCSession.default.activationState == .activated else { return }
        #if os(iOS)
        guard WCSession.default.isWatchAppInstalled else { return }
        #else
        guard WCSession.default.isCompanionAppInstalled else { return }
        #endif
        //let message: [String: Any] = [messageKey: message]
        WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: errorSendingMessage)
    }
    
    func errorSendingMessage(_ error: Error) {
        print("Nous n'avons pas pu envoyer ce message car: \n\(error.localizedDescription)")
    }
}
