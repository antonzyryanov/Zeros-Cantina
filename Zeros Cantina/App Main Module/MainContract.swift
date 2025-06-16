//
//  MainContract.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

protocol PresenterToUIMainProtocol {
   
}

protocol ViewToPresenterMainProtocol {
    
    var externalUI: PresenterToUIMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }
    var output: MainModuleDataOutputProtocol? { get set }
}

protocol PresenterToInteractorMainProtocol {
    var presenter: InteractorToPresenterMainProtocol? { get set }
    func activate()
}

protocol InteractorToPresenterMainProtocol {
    func handeInteractorUpdateOf(characters: [CharacterCardModel])
    func handeInteractorUpdateOf(vehicles: [VehiclesCardModel])
    func handeInteractorUpdateOf(planets: [PlanetCardModel])
}

protocol PresenterToRouterMainProtocol {
    
}

protocol RouterToPresenterMainProtocol {
    func activate()
}
