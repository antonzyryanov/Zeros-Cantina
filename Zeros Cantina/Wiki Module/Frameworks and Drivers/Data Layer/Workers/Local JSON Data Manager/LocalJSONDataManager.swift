//
//  LocalJSONDataManager.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 16.06.2025.
//

import Foundation

class LocalJSONDataManager: DataRepositoryWorkerProtocol {
    
    let charactersFetcher = LocalJSONCharactersFetcher()
    let planetsFetcher = LocalJSONPlanetsFetcher()
    
    func fetchCards(completion: @escaping (([any CardItemProtocol]) -> Void), cardType: String) {
        if cardType == "characters" {
            fetchCharacters(completion: completion)
        }
        if cardType == "planets" {
            fetchPlanets(completion: completion)
        }
    }
    
    private func fetchCharacters(completion: @escaping ([any CardItemProtocol]) -> Void) {
        charactersFetcher.fetchCharacters(completion: completion)
    }
    
    private func fetchPlanets(completion: @escaping ([any CardItemProtocol]) -> Void) {
        planetsFetcher.fetchPlanets(completion: completion)
    }
    
}
