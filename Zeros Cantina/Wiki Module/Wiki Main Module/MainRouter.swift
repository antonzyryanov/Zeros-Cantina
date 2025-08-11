//
//  MainRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation
import UIKit

class MainRouter: PresenterToRouterMainProtocol, MainRouterProtocol, RouterProtocol {
    
    var presenter: ViewToPresenterMainProtocol & InteractorToPresenterMainProtocol & RouterToPresenterMainProtocol = MainPresenter()
    
    var childRouters: [RouterProtocol] = []
    
    func activate() {
        presenter.activate()
    }
    
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
            case "Wiki":
                showCharactersScreen()
            case "Characters":
                showCharactersScreen()
            case "Vehicles":
                showVehiclesScreen()
            case "Planets":
                showPlanetsScreen()
            case "Menu":
                showMenuScreen()
            case "Quotes":
                showQuotesScreen()
            case "Heroes Cards":
                showHeroesCardsScreen()
            case "WebSocket":
                showWebSocketScreen()
            case "Stocks":
                showStocksScreen()
            default:
                _ = "default"
        }
    }
    
    func showCharactersScreen() {
        guard
        let charactersScreenVCRouter = childRouters[1] as? CharactersScreenRouter,
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
        let vehiclesScreenVCRouter = childRouters[2] as? VehiclesScreenRouter,
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
        let planetsScreenVCRouter = childRouters[3] as? PlanetsScreenRouter,
        let planetsScreenVC = planetsScreenVCRouter.presenter.view as? PlanetsScreenViewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Planets screen")
            return
        }
        currentWindow.rootViewController = planetsScreenVC
    }
    
    func showQuotesScreen() {
        guard
        let quotesRouter = childRouters[4] as? QuotesScreenRouter,
        let quotesRouterVC = quotesRouter.viewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Menu screen")
            return
        }
        currentWindow.rootViewController = quotesRouterVC
    }
    
    func showHeroesCardsScreen() {
        guard
        let heroesCardsRouter = childRouters[5] as? HeroesCardsScreenRouter,
        let heroesCardsVC = heroesCardsRouter.viewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Menu screen")
            return
        }
        currentWindow.rootViewController = heroesCardsVC
    }
    
    func showWebSocketScreen() {
        guard
        let webSocketRouter = childRouters[6] as? WebSocketRouter,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Menu screen")
            return
        }
        let webSocketVC = webSocketRouter.view
        currentWindow.rootViewController = webSocketVC
    }
    
    func showStocksScreen() {
        guard
        let stocksScreenRouter = childRouters[7] as? StocksRouter,
        let stocksVC = stocksScreenRouter.presenter.view as? StocksViewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Stoks screen")
            return
        }
        currentWindow.rootViewController = stocksVC
    }
    
    func showMenuScreen() {
        guard
        let menuRouter = childRouters[0] as? MenuScreenRouter,
        let menuRouterVC = menuRouter.viewController,
        let currentWindow = UIApplication.shared.currentWindow
        else {
            print("[MainRouter] failed to show Menu screen")
            return
        }
        currentWindow.rootViewController = menuRouterVC
    }
    
    func createModule(dataRepository: MainDataRepositoryProtocol)  {
        presenter.router = self
        let interactor = MainInteractor(dataRepository: dataRepository)
        presenter.interactor = interactor
        interactor.presenter = self.presenter
    }
    
}
