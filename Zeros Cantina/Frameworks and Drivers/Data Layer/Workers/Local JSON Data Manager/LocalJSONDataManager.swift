//
//  LocalJSONDataManager.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 16.06.2025.
//

import Foundation

class LocalJSONDataManager: DataRepositoryWorkerProtocol {
    
    let planetsFetcher = LocalJSONPlanetsFetcher()
    
    func fetchCards(completion: @escaping (([any CardItemProtocol]) -> Void), cardType: String) {
        if cardType == "planets" {
            fetchPlanets(completion: completion)
        }
    }
    
    private func fetchPlanets(completion: @escaping ([any CardItemProtocol]) -> Void) {
        planetsFetcher.fetchPlanets(completion: completion)
    }
    
}
