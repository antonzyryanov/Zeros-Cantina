//
//  SWAPIPlanetsFetcher.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class SWAPIPlanetsFetcher {
    
    func fetchPlanets(completion: @escaping ([any CardItemProtocol]) -> Void) {
        let url = URL(string: "https://www.swapi.tech/api/planets")!
        print("[SWAPIPlanetsFetcher]: Fetching planets...")
           let session = URLSession.shared
           var request = URLRequest(url: url)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue("application/json", forHTTPHeaderField: "Accept")
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    
               guard error == nil else {
                   print("[SWAPIPlanetsFetcher] Fetching planets failed: \(error)")
                   return
               }
                    
               guard let data = data else {
                   print("[SWAPIPlanetsFetcher] Fetching planets failed: No data")
                   return
               }
               
               if let str = String(data: data, encoding: .utf8) {
                   print("[SWAPIPlanetsFetcher] Successfully decoded data: \(str)")
               }
              
              do {
                  let planetsContainerModel = try? JSONDecoder().decode(SWAPIPlanetsContainerModel.self, from: data)
                  var cards: [CardItemProtocol] = []
                  for planet in planetsContainerModel?.results ?? [] {
                      cards.append(PlanetCardModel(title: planet.name, description: planet.uid, imageLink: "", isFavorite: false))
                  }
                  completion(cards)
              } catch let error {
                print("[SWAPIPlanetsFetcher]: JSONSeriliaziation failed")
                print(error.localizedDescription)
              }
           })

           task.resume()
    }
    
}

