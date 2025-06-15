//
//  CharactersScreenPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class CharactersScreenPresenter: ViewToPresenterCharactersScreenProtocol {

    var view: PresenterToViewCharactersScreenProtocol?
    var interactor: PresenterToInteractorCharactersScreenProtocol?
    var router: PresenterToRouterCharactersScreenProtocol?
}

extension CharactersScreenPresenter: InteractorToPresenterCharactersScreenProtocol {
    
}
