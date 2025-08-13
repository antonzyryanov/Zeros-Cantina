//
//  RoutersFactory.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

class ModulesFactoryImpl: ModulesFactoryProtocol {
    
    func createMenuModule() -> MenuScreenRouter {
        let menuRouter = MenuScreenRouter()
        menuRouter.createModule()
        return menuRouter
    }
    
    func createMainWikiModule(dataRepository: MainDataRepositoryProtocol) -> RouterProtocol {
        let mainRouter = MainRouter()
        mainRouter.createModule(dataRepository: dataRepository)
        mainRouter.presenter.output = MainModuleProxyImpl.shared
        return mainRouter
    }
    
    func createCharactersScreenModule(charactersDataInput: CharactersModuleDataInputProtocol) -> CharactersScreenRouter {
        let charactersRouter = CharactersScreenRouter()
        charactersRouter.createModule(charactersDataInput: charactersDataInput)
        return charactersRouter
    }
    
    func createVehiclesScreenModule(vehiclesDataInput: VehiclesModuleDataInputProtocol) -> VehiclesScreenRouter {
        let vehiclesRouter = VehiclesScreenRouter()
        vehiclesRouter.createModule(vehiclesDataInput: vehiclesDataInput)
        return vehiclesRouter
    }
    
    func createPlanetsScreenModule(planetsDataInput: PlanetsModuleDataInputProtocol) -> PlanetsScreenRouter {
        let planetsRouter = PlanetsScreenRouter()
        planetsRouter.createModule(planetsDataInput: planetsDataInput)
        return planetsRouter
    }
    
    func createQuotesModule() -> QuotesScreenRouter {
        let quotesRouter = QuotesScreenRouter()
        quotesRouter.createModule()
        return quotesRouter
    }
    
    func createHeroesCardsModule() -> HeroesCardsScreenRouter {
        let heroesCardsRouter = HeroesCardsScreenRouter()
        heroesCardsRouter.createModule()
        return heroesCardsRouter
    }
    
    func createWebsocketModule() -> WebSocketRouter {
        let websocketRouter = WebSocketRouter()
        websocketRouter.createModule()
        return websocketRouter
    }
    
    func createStocksModule(dataRepository: StocksDataRepositoryProtocol) -> StocksRouter {
        let stocksRouter = StocksRouter()
        stocksRouter.createModule(dataRepository: dataRepository)
        return stocksRouter
    }
    
    func createMapsModule() -> MapsRouter {
        let mapsRouter = MapsRouter()
        mapsRouter.createModule()
        return mapsRouter
    }
    
}
