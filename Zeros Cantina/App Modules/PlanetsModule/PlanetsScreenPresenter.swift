//
//  PlanetsScreenPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class PlanetsScreenPresenter: ViewToPresenterPlanetsScreenProtocol {
    
    var presentationModels: [PlanetCardModel] = []

    var view: PresenterToViewPlanetsScreenProtocol?
    var interactor: PresenterToInteractorPlanetsScreenProtocol?
    var router: PresenterToRouterPlanetsScreenProtocol?
    
    func navigateTo(screen: String) {
        router?.navigateTo(screen: screen)
    }
    
    func handleViewRequest() {
        
    }
    
}

extension PlanetsScreenPresenter: InteractorToPresenterPlanetsScreenProtocol {
    func handleInteractorsRequest(models: [PlanetCardModel]) {
        presentationModels = models
        view?.updateView()
    }
}
