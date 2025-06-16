//
//  PlanetsScreenRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation
import UIKit

class PlanetsScreenRouter: PresenterToRouterPlanetsScreenProtocol, RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    let presenter: ViewToPresenterPlanetsScreenProtocol & InteractorToPresenterPlanetsScreenProtocol = PlanetsScreenPresenter()
    
    func createModule(planetsDataInput: PlanetsModuleDataInputProtocol) {
        let viewController = PlanetsScreenViewController()
        viewController.presenter = presenter
        viewController.presenter?.router = self
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlanetsScreenInteractor(planetsDataInput: planetsDataInput)
        viewController.presenter?.interactor?.presenter = presenter
    }
    
}
