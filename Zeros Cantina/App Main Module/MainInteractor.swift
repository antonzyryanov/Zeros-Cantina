//
//  MainInteractor.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {
    
    let mainEntity = MainEntity()
    
    var presenter: InteractorToPresenterMainProtocol?
    
    var dataRepository: MainDataRepositoryProtocol
    
    init(dataRepository: MainDataRepositoryProtocol) {
        self.dataRepository = dataRepository
        getCharacters()
        getVehicles()
    }
    
    func getCharacters() {
        dataRepository.fetchCharacters { characters in
            self.mainEntity.characters = characters
            print("[MainInteractor] Characters fetched: \(self.mainEntity.characters)")
            self.requestPresenterCharactersUpdate()
        }
    }
    
    func requestPresenterCharactersUpdate() {
        guard let charactersModels = mainEntity.characters as? [CharacterCardModel] else { return }
        presenter?.handeInteractorUpdateOf(characters: charactersModels)
    }
    
    func getVehicles() {
        dataRepository.fetchVehicles { vehicles in
            self.mainEntity.vehicles = vehicles
            print("[MainInteractor] Vehicles fetched: \(self.mainEntity.vehicles)")
            self.requestPresenterForVehiclesUpdate()
        }
    }
    
    func requestPresenterForVehiclesUpdate() {
        guard let vehiclessModels = mainEntity.vehicles as? [VehiclesCardModel] else { return }
        presenter?.handeInteractorUpdateOf(vehicles: vehiclessModels)
    }
    
}
