//
//  MainRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation
import UIKit

class MainRouter: PresenterToRouterMainProtocol, RouterProtocol {
    
    var presenter: ViewToPresenterMainProtocol & InteractorToPresenterMainProtocol = MainPresenter()
    
    var childRouters: [RouterProtocol] = []
    
    func setupDependencies(childRouters: [RouterProtocol]) {
        self.childRouters = childRouters
    }
    
    func navigateTo(screen: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.show(screen: screen)
        }
    }
    
    func show(screen: String) {
        switch screen {
            case "Characters":
                showCharactersScreen()
            case "Vehicles":
                showVehiclesScreen()
            case "Planets":
                showPlanetsScreen()
            default:
                _ = "default"
        }
    }
    
    func showCharactersScreen() {
        guard
        let charactersScreenVCRouter = childRouters[0] as? CharactersScreenRouter,
        let charactersScreenVC = charactersScreenVCRouter.presenter.view as? CharactersScreenViewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Characters screen")
            return
        }
        currentWindow.rootViewController = charactersScreenVC
    }
    
    func showVehiclesScreen() {
        guard
        let vehiclesScreenVCRouter = childRouters[1] as? VehiclesScreenRouter,
        let vehiclesScreenVC = vehiclesScreenVCRouter.presenter.view as? VehiclesScreenViewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Vehicles screen")
            return
        }
        currentWindow.rootViewController = vehiclesScreenVC
    }
    
    func showPlanetsScreen() {
        guard
        let planetsScreenVCRouter = childRouters[2] as? PlanetsScreenRouter,
        let planetsScreenVC = planetsScreenVCRouter.presenter.view as? PlanetsScreenViewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Planets screen")
            return
        }
        currentWindow.rootViewController = planetsScreenVC
    }
    
    func createModule(dataRepository: MainDataRepositoryProtocol)  {
        presenter.router = self
        let interactor = MainInteractor(dataRepository: dataRepository)
        presenter.interactor = interactor
        interactor.presenter = self.presenter
    }
    
}
