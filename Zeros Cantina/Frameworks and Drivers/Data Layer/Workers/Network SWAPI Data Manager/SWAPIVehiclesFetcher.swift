//
//  SWAPIVehiclesFetcher.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class SWAPIVehiclesFetcher {
    
    func fetchVehicles(completion: @escaping ([any CardItemProtocol]) -> Void) {
        let url = URL(string: "https://www.swapi.tech/api/vehicles")!
        print("[SWAPIVehiclesFetcher]: Fetching vehicles...")
           let session = URLSession.shared
           var request = URLRequest(url: url)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.setValue("application/json", forHTTPHeaderField: "Accept")
           let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                    
               guard error == nil else {
                   print("[SWAPIVehiclesFetcher] Fetching vehicles failed: \(error)")
                   return
               }
                    
               guard let data = data else {
                   print("[SWAPIVehiclesFetcher] Fetching vehicles failed: No data")
                   return
               }
               
               if let str = String(data: data, encoding: .utf8) {
                   print("[SWAPIVehiclesFetcher] Successfully decoded data: \(str)")
               }
              
              do {
                  let vehiclesContainerModel = try? JSONDecoder().decode(SWAPIVehiclesContainerModel.self, from: data)
                  var cards: [CardItemProtocol] = []
                  for vehicle in vehiclesContainerModel?.results ?? [] {
                      cards.append(VehiclesCardModel(localImage: "", title: vehicle.name, description: vehicle.uid, imageLink: "", isFavorite: false))
                  }
                  completion(cards)
              } catch let error {
                print("[SWAPIVehiclesFetcher]: JSONSeriliaziation failed")
                print(error.localizedDescription)
              }
           })

           task.resume()
    }
    
}

