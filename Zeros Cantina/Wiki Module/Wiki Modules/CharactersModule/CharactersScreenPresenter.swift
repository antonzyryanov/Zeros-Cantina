//
//  CharactersScreenPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class CharactersScreenPresenter: ViewToPresenterCharactersScreenProtocol {
    
    var presentationModels: [CharacterCardModel] = []

    var view: PresenterToViewCharactersScreenProtocol?
    var interactor: PresenterToInteractorCharactersScreenProtocol?
    var router: PresenterToRouterCharactersScreenProtocol?
    
    func navigateTo(screen: String) {
        router?.navigateTo(screen: screen)
    }
    
    func handleViewRequest() {
        
    }
    
}

extension CharactersScreenPresenter: InteractorToPresenterCharactersScreenProtocol {
    func handleInteractorsRequest(models: [CharacterCardModel]) {
        presentationModels = models
        view?.updateView()
    }
}
