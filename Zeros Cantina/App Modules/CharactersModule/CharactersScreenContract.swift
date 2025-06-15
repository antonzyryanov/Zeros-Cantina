//
//  CharactersScreenContract.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

protocol PresenterToViewCharactersScreenProtocol {
   
}

protocol ViewToPresenterCharactersScreenProtocol {
    
    var view: PresenterToViewCharactersScreenProtocol? { get set }
    var interactor: PresenterToInteractorCharactersScreenProtocol? { get set }
    var router: PresenterToRouterCharactersScreenProtocol? { get set }
}

protocol PresenterToInteractorCharactersScreenProtocol {
    
    var presenter: InteractorToPresenterCharactersScreenProtocol? { get set }
}

protocol InteractorToPresenterCharactersScreenProtocol {
    
}

protocol PresenterToRouterCharactersScreenProtocol {
    
}
