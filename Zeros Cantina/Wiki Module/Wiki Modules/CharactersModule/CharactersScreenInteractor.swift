//
//  CharactersScreenInteractor.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import Foundation

class CharactersScreenInteractor: PresenterToInteractorCharactersScreenProtocol {
    
    var presenter: InteractorToPresenterCharactersScreenProtocol?
    
    var charactersDataInput: CharactersModuleDataInputProtocol
    
    init(charactersDataInput: CharactersModuleDataInputProtocol, presenter: InteractorToPresenterCharactersScreenProtocol? = nil) {
        self.charactersDataInput = charactersDataInput
        self.presenter = presenter
        subscribeForInputUpdates()
    }
    
    func handlePresenterRequest() {
        if charactersDataInput.characters.count > 0 {
            requestPresenterForUpdate()
        } else {
            
        }
    }
    
    func requestPresenterForUpdate() {
        presenter?.handleInteractorsRequest(models: charactersDataInput.characters)
    }
    
    private func subscribeForInputUpdates() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.charactersModelUpdated), name: .init(charactersDataInput.charactersUpdateSubscriptionKey) , object: nil)
    }
    
    @objc func charactersModelUpdated() {
        requestPresenterForUpdate()
    }
    
}
