//
//  PlanetsScreenInteractor.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class PlanetsScreenInteractor: PresenterToInteractorPlanetsScreenProtocol {
    
    var presenter: InteractorToPresenterPlanetsScreenProtocol?
    
    var planetsDataInput: PlanetsModuleDataInputProtocol
    
    init(planetsDataInput: PlanetsModuleDataInputProtocol, presenter: InteractorToPresenterPlanetsScreenProtocol? = nil) {
        self.planetsDataInput = planetsDataInput
        self.presenter = presenter
        subscribeForInputUpdates()
    }
    
    func handlePresenterRequest() {
        if planetsDataInput.planets.count > 0 {
            requestPresenterForUpdate()
        } else {
            
        }
    }
    
    func requestPresenterForUpdate() {
        presenter?.handleInteractorsRequest(models: planetsDataInput.planets)
    }
    
    private func subscribeForInputUpdates() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.planetsModelUpdated), name: .init(planetsDataInput.planetsUpdateSubscriptionKey) , object: nil)
    }
    
    @objc func planetsModelUpdated() {
        requestPresenterForUpdate()
    }
    
}
