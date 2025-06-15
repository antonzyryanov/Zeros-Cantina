//
//  VehiclesScreenPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class VehiclesScreenPresenter: ViewToPresenterVehiclesScreenProtocol {
    
    var presentationModels: [VehiclesCardModel] = []

    var view: PresenterToViewVehiclesScreenProtocol?
    var interactor: PresenterToInteractorVehiclesScreenProtocol?
    var router: PresenterToRouterVehiclesScreenProtocol?
    
    func navigateTo(screen: String) {
        router?.navigateTo(screen: screen)
    }
    
    func handleViewRequest() {
        
    }
    
}

extension VehiclesScreenPresenter: InteractorToPresenterVehiclesScreenProtocol {
    func handleInteractorsRequest(models: [VehiclesCardModel]) {
        presentationModels = models
        view?.updateView()
    }
}
