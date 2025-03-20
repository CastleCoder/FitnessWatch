//
//  Connectivity.swift
//  FitnessWatch
//
//  Created by Cyrille Chateau on 08/12/2024.
//

import Foundation
import WatchConnectivity
import SwiftData

class Connectivity: NSObject, ObservableObject {
    
    static let shared = Connectivity()
    var modelContext: ModelContext?
    let messageKey = "Hello"
    @Published var message: Series? = nil
    @Published var receivedMuscle: String? = nil
    @Published var receivedExercice: String?
    @Published var receivedWeight: Int?
    @Published var receivedRep: Int?
    @Published var receivedSet: Int?
    @Published var receivedDate: Date?

    
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
    
    func sendSeriesData(_ data: [String: Any]) {
        WCSession.default.transferUserInfo(data)
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
