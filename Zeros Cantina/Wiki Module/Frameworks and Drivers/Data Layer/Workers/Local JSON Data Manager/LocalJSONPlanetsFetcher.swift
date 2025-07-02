//
//  LocalJSONPlanetsFetcher.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 16.06.2025.
//

import Foundation

class LocalJSONPlanetsFetcher {
    
    func fetchPlanets(completion: @escaping ([any CardItemProtocol]) -> Void) {
        
        if let path = Bundle.main.path(forResource: "planets", ofType: "json")
        {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                let planetsContainerModel = try? JSONDecoder().decode(SWAPIPlanetsContainerModel.self, from: jsonData as Data)
                var cards: [CardItemProtocol] = []
                for planet in planetsContainerModel?.results ?? [] {
                    cards.append(PlanetCardModel(localImage: planet.image ?? "", title: planet.name, description: planet.uid, imageLink: "", isFavorite: false))
                }
                completion(cards)
            } catch let error {
                print("[LocalJSONPlanetsFetcher]: JSONSeriliaziation failed")
                print(error.localizedDescription)
            }
            
        } else {
            
        }
        
    }
    
}
