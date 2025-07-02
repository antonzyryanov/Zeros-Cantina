//
//  VehiclesScreenRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation
import UIKit

class VehiclesScreenRouter: PresenterToRouterVehiclesScreenProtocol, RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    let presenter: ViewToPresenterVehiclesScreenProtocol & InteractorToPresenterVehiclesScreenProtocol = VehiclesScreenPresenter()
    
    func createModule(vehiclesDataInput: VehiclesModuleDataInputProtocol) {
        let viewController = VehiclesScreenViewController()
        viewController.presenter = presenter
        viewController.presenter?.router = self
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = VehiclesScreenInteractor(vehiclesDataInput: vehiclesDataInput)
        viewController.presenter?.interactor?.presenter = presenter
    }
    
}
