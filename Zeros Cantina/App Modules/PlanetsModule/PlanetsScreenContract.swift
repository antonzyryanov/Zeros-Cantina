//
//  PlanetsScreenContract.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

protocol PresenterToViewPlanetsScreenProtocol {
   func updateView()
}

protocol ViewToPresenterPlanetsScreenProtocol {
    var presentationModels: [PlanetCardModel] { get set }
    var view: PresenterToViewPlanetsScreenProtocol? { get set }
    var interactor: PresenterToInteractorPlanetsScreenProtocol? { get set }
    var router: PresenterToRouterPlanetsScreenProtocol? { get set }
    
    func handleViewRequest()
    func navigateTo(screen: String)
}

protocol PresenterToInteractorPlanetsScreenProtocol {
    
    var presenter: InteractorToPresenterPlanetsScreenProtocol? { get set }
    
    func handlePresenterRequest()
}

protocol InteractorToPresenterPlanetsScreenProtocol {
    func handleInteractorsRequest(models: [PlanetCardModel])
    
}

protocol PresenterToRouterPlanetsScreenProtocol {
    func navigateTo(screen: String)
}
