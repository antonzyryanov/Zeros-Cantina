//
//  SWAPICharactersFetcher.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class SWAPICharactersFetcher {
    
    func fetchCharacters(completion: @escaping ([any CardItemProtocol]) -> Void) {
        let url = URL(string: "https://www.swapi.tech/api/people")!
        print("[SWAPICharactersFetcher]: Fetching characters...")
           let session = URLSession.shared
           var request = URLRequest(url: url)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue("application/json", forHTTPHeaderField: "Accept")
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    
               guard error == nil else {
                   print("[SWAPICharactersFetcher] Fetching characters failed: \(error)")
                   return
               }
                    
               guard let data = data else {
                   print("[SWAPICharactersFetcher] Fetching characters failed: No data")
                   return
               }
               
               if let str = String(data: data, encoding: .utf8) {
                   print("[SWAPICharactersFetcher] Successfully decoded data: \(str)")
               }
              
              do {
                  let charactersContainerModel = try? JSONDecoder().decode(SWAPICharactersContainerModel.self, from: data)
                  var cards: [CardItemProtocol] = []
                  for character in charactersContainerModel?.results ?? [] {
                      cards.append(CharacterCardModel(localImage: "", title: character.name, description: character.uid, imageLink: "", isFavorite: false))
                  }
                  completion(cards)
              } catch let error {
                print("[SWAPICharactersFetcher]: JSONSeriliaziation failed")
                print(error.localizedDescription)
              }
           })

           task.resume()
    }
    
}
