//
//  NetworkDataManager.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class NetworkSWAPIDataManager: DataRepositoryWorkerProtocol {
    
    let charactersFetcher = SWAPICharactersFetcher()
    let vehiclesFetcher = SWAPIVehiclesFetcher()
    
    func fetchCards(completion: @escaping (([any CardItemProtocol]) -> Void), cardType: String) {
        if cardType == "characters" {
            fetchCharacters(completion: completion)
        }
        if cardType == "vehicles" {
            fetchVehicles(completion: completion)
        }
    }
    
    private func fetchCharacters(completion: @escaping ([any CardItemProtocol]) -> Void) {
        charactersFetcher.fetchCharacters(completion: completion)
    }
    
    private func fetchVehicles(completion: @escaping ([any CardItemProtocol]) -> Void) {
        vehiclesFetcher.fetchVehicles(completion: completion)
    }
    
}
