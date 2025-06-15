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
        guard let modulesFactoryImpl = modulesFactory as? ModulesFactoryImpl else { return [] }
        var routers: [RouterProtocol] = []
        let charactersScreenRouter = modulesFactoryImpl.createCharactersScreenModule()
        routers.append(charactersScreenRouter)
        return routers
    }
    
    func setupRouterDependencies(routers: [RouterProtocol]) {
        guard let mainRouter = rootRouter as? MainRouter else { return }
        mainRouter.setupDependencies(childRouters: routers)
    }
        
}
