//
//  CharactersScreenRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation
import UIKit

class CharactersScreenRouter: PresenterToRouterCharactersScreenProtocol, RouterProtocol {
    
    let presenter: ViewToPresenterCharactersScreenProtocol & InteractorToPresenterCharactersScreenProtocol = CharactersScreenPresenter()
    
    func createModule(charactersDataInput: CharactersModuleDataInputProtocol) {
        let viewController = CharactersScreenViewController()
        viewController.presenter = presenter
        viewController.presenter?.router = self
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CharactersScreenInteractor(charactersDataInput: charactersDataInput)
        viewController.presenter?.interactor?.presenter = presenter
    }
    
}
