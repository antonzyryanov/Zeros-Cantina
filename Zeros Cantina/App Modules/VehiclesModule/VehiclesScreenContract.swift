//
//  VehiclesScreenContract.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

protocol PresenterToViewVehiclesScreenProtocol {
   func updateView()
}

protocol ViewToPresenterVehiclesScreenProtocol {
    var presentationModels: [VehiclesCardModel] { get set }
    var view: PresenterToViewVehiclesScreenProtocol? { get set }
    var interactor: PresenterToInteractorVehiclesScreenProtocol? { get set }
    var router: PresenterToRouterVehiclesScreenProtocol? { get set }
    
    func handleViewRequest()
    func navigateTo(screen: String)
}

protocol PresenterToInteractorVehiclesScreenProtocol {
    
    var presenter: InteractorToPresenterVehiclesScreenProtocol? { get set }
    
    func handlePresenterRequest()
}

protocol InteractorToPresenterVehiclesScreenProtocol {
    func handleInteractorsRequest(models: [VehiclesCardModel])
    
}

protocol PresenterToRouterVehiclesScreenProtocol {
    func navigateTo(screen: String)
}
