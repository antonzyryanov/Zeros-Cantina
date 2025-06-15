//
//  MainPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {
    var externalUI: PresenterToUIMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    
}
