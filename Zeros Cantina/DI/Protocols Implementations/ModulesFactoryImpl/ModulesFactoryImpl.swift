//
//  RoutersFactory.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

class ModulesFactoryImpl: ModulesFactoryProtocol {
    
    func createMainModule(dataRepository: MainDataRepositoryProtocol) -> RouterProtocol {
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
    
}
