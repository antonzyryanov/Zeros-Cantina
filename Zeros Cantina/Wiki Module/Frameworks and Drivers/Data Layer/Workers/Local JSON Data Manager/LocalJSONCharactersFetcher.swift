//
//  LocalJSONCharactersFetcher.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 16.06.2025.
//

import Foundation

class LocalJSONCharactersFetcher {
    
    func fetchCharacters(completion: @escaping ([any CardItemProtocol]) -> Void) {
        
        if let path = Bundle.main.path(forResource: "characters", ofType: "json")
        {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                let charactersContainerModel = try? JSONDecoder().decode(SWAPICharactersContainerModel.self, from: jsonData as Data)
                var cards: [CardItemProtocol] = []
                for character in charactersContainerModel?.results ?? [] {
                    cards.append(CharacterCardModel(localImage: character.image ?? "", title: character.name, description: character.uid, imageLink: "", isFavorite: false))
                }
                completion(cards)
            } catch let error {
                print("[LocalJSONCharactersFetcher]: JSONSeriliaziation failed")
                print(error.localizedDescription)
            }
            
        } else {
            
        }
        
    }
    
}
