//
//  MainModuleProxyImpl.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class MainModuleProxyImpl: MainModuleCharactersOutputProtocol {
    
    static let shared = MainModuleProxyImpl()
    
    internal var characters: [CharacterCardModel] = [] {
        didSet {
            NotificationCenter.default.post(name: .CharactersUpdated, object: nil)
        }
    }
    
    private init() {
        
    }
    
}

extension MainModuleProxyImpl: CharactersModuleDataInputProtocol {
    var charactersUpdateSubscriptionKey: String {
        get {
            Notification.Name.CharactersUpdated.rawValue
        }
    }
    
    func requestCharactersData() {
        NotificationCenter.default.post(name: .CharactersRequest, object: nil)
    }
}
