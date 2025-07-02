//
//  MainPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {
    var externalUI: PresenterToUIMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    var output: MainModuleDataOutputProtocol?
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    
    func handeInteractorUpdateOf(characters: [CharacterCardModel]) {
        output?.characters = characters
    }
    
    func handeInteractorUpdateOf(vehicles: [VehiclesCardModel]) {
        output?.vehicles = vehicles
    }
    
    func handeInteractorUpdateOf(planets: [PlanetCardModel]) {
        output?.planets = planets
    }
    
}

extension MainPresenter: RouterToPresenterMainProtocol {
    func activate() {
        interactor?.activate()
    }
}
