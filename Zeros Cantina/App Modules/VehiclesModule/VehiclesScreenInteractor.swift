//
//  VehiclesScreenInteractor.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class VehiclesScreenInteractor: PresenterToInteractorVehiclesScreenProtocol {
    
    var presenter: InteractorToPresenterVehiclesScreenProtocol?
    
    var vehiclesDataInput: VehiclesModuleDataInputProtocol
    
    init(vehiclesDataInput: VehiclesModuleDataInputProtocol, presenter: InteractorToPresenterVehiclesScreenProtocol? = nil) {
        self.vehiclesDataInput = vehiclesDataInput
        self.presenter = presenter
        subscribeForInputUpdates()
    }
    
    func handlePresenterRequest() {
        if vehiclesDataInput.vehicles.count > 0 {
            requestPresenterForUpdate()
        } else {
            
        }
    }
    
    func requestPresenterForUpdate() {
        presenter?.handleInteractorsRequest(models: vehiclesDataInput.vehicles)
    }
    
    private func subscribeForInputUpdates() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.vehiclesModelUpdated), name: .init(vehiclesDataInput.vehiclesUpdateSubscriptionKey) , object: nil)
    }
    
    @objc func vehiclesModelUpdated() {
        requestPresenterForUpdate()
    }
    
}
