//
//  CharactersScreenContract.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

protocol PresenterToViewCharactersScreenProtocol {
   func updateView()
}

protocol ViewToPresenterCharactersScreenProtocol {
    var presentationModels: [CharacterCardModel] { get set }
    var view: PresenterToViewCharactersScreenProtocol? { get set }
    var interactor: PresenterToInteractorCharactersScreenProtocol? { get set }
    var router: PresenterToRouterCharactersScreenProtocol? { get set }
    
    func handleViewRequest()
    func navigateTo(screen: String)
}

protocol PresenterToInteractorCharactersScreenProtocol {
    
    var presenter: InteractorToPresenterCharactersScreenProtocol? { get set }
    
    func handlePresenterRequest()
}

protocol InteractorToPresenterCharactersScreenProtocol {
    func handleInteractorsRequest(models: [CharacterCardModel])
    
}

protocol PresenterToRouterCharactersScreenProtocol {
    func navigateTo(screen: String)
}
