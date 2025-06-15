//
//  DataRepositoryImpl.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

class MainDataRepositoryImpl: MainDataRepositoryProtocol {
    
    var externalWorker: DataRepositoryWorkerProtocol = NetworkSWAPIDataManager()
    var internalWorker: DataRepositoryWorkerProtocol = CoreDataManager()
    
    func fetchCharacters(completion: @escaping ([CharacterCardModel]) -> Void) {
        externalWorker.fetchCards(completion: { charactersCards in
            guard let characters = charactersCards as? [CharacterCardModel] else { return }
            completion(characters)
        }, cardType: CardType.characters.rawValue)
    }
    
    func fetchVehicles(completion: @escaping ([VehiclesCardModel]) -> Void) {
        externalWorker.fetchCards(completion: { vehiclesCards in
            guard let vehicles = vehiclesCards as? [VehiclesCardModel] else { return }
            completion(vehicles)
        }, cardType: CardType.vehicles.rawValue)
    }
    
}
