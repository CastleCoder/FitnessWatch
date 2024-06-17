//
//  DataManager.swift
//  FitnessWatch Watch App
//
//  Created by Cyrille Chateau on 13/06/2024.
//

import SwiftUI

class DataManager: ObservableObject {
    @Published var seriesList: [Series] = []

    func addSeries(_ series: Series) {
        seriesList.append(series)
    }
    
    func updateSeries(_ series: Series) {
        if let index = seriesList.firstIndex(where: { $0.id == series.id }) {
            seriesList[index] = series
        }
    }
    
    func deleteSeries(_ series: Series) {
        if let index = seriesList.firstIndex(where: { $0.id == series.id }) {
            seriesList.remove(at: index)
        }
    }
}

