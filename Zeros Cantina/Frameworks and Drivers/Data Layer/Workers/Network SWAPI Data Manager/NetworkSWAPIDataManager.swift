//
//  NetworkDataManager.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class NetworkSWAPIDataManager: DataRepositoryWorkerProtocol {
    
    let charactersFetcher = SWAPICharactersFetcher()
    
    func fetchCards(completion: @escaping (([any CardItemProtocol]) -> Void), cardType: String) {
        if cardType == "characters" {
            fetchCharacters(completion: completion)
        }
    }
    
    private func fetchCharacters(completion: @escaping ([any CardItemProtocol]) -> Void) {
        charactersFetcher.fetchCharacters(completion: completion)
    }
    
}
