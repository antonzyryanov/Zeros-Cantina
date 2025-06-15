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
    
    func createModule(dataRepository: MainDataRepositoryProtocol)  {
        presenter.router = self
        let interactor = MainInteractor(dataRepository: dataRepository)
        presenter.interactor = interactor
        interactor.presenter = self.presenter
    }
    
}
