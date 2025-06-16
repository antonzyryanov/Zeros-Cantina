//
//  DIContainer.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

class DIContainer: DIContainerProtocol {
    
    var modulesFactory: ModulesFactoryProtocol = ModulesFactoryImpl()
    
    var rootRouter: RouterProtocol
    
    init() {
        let mainDataRepositoryImpl = MainDataRepositoryImpl()
        self.rootRouter = modulesFactory.createMainModule(dataRepository: mainDataRepositoryImpl)
        let modulesRouters = self.createModules()
        setupRouterDependencies(routers: modulesRouters)
        NotificationCenter.default.post(name: .DICompleted, object: nil)
    }
    
    func createModules() -> [any RouterProtocol] {
        guard let modulesFactoryImpl = modulesFactory as? ModulesFactoryImpl,
        let mainRouter = rootRouter as? MainRouter,
        let mainModuleProxy = mainRouter.presenter.output
        else { return [] }
        var routers: [RouterProtocol] = []
        createCharactersRouter(modulesFactoryImpl, mainModuleProxy, &routers, mainRouter)
        createVehiclesModule(modulesFactoryImpl, mainModuleProxy, &routers, mainRouter)
        createPlanetsModule(modulesFactoryImpl, mainModuleProxy, &routers, mainRouter)
        return routers
    }
    
    private func createCharactersRouter(_ modulesFactoryImpl: ModulesFactoryImpl, _ mainModuleProxy: any MainModuleDataOutputProtocol, _ routers: inout [any RouterProtocol], _ mainRouter: MainRouter) {
        let charactersScreenRouter = modulesFactoryImpl.createCharactersScreenModule(charactersDataInput: mainModuleProxy as! CharactersModuleDataInputProtocol)
        routers.append(charactersScreenRouter)
        charactersScreenRouter.mainRouter = mainRouter
    }
    
    private func createVehiclesModule(_ modulesFactoryImpl: ModulesFactoryImpl, _ mainModuleProxy: any MainModuleDataOutputProtocol, _ routers: inout [any RouterProtocol], _ mainRouter: MainRouter) {
        let vehiclesScreenRouter = modulesFactoryImpl.createVehiclesScreenModule(vehiclesDataInput: mainModuleProxy as! VehiclesModuleDataInputProtocol)
        routers.append(vehiclesScreenRouter)
        vehiclesScreenRouter.mainRouter = mainRouter
    }
    
    private func createPlanetsModule(_ modulesFactoryImpl: ModulesFactoryImpl, _ mainModuleProxy: any MainModuleDataOutputProtocol, _ routers: inout [any RouterProtocol], _ mainRouter: MainRouter) {
        let planetsScreenRouter = modulesFactoryImpl.createPlanetsScreenModule(planetsDataInput: mainModuleProxy as! PlanetsModuleDataInputProtocol)
        routers.append(planetsScreenRouter)
        planetsScreenRouter.mainRouter = mainRouter
    }
    
    func setupRouterDependencies(routers: [RouterProtocol]) {
        guard let mainRouter = rootRouter as? MainRouter else { return }
        mainRouter.setupDependencies(childRouters: routers)
        mainRouter.activate()
    }
        
}
