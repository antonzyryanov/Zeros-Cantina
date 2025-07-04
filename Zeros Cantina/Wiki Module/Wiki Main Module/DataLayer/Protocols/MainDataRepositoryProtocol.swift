//
//  DataRepositoryProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

protocol MainDataRepositoryProtocol {
    func fetchCharacters(completion: @escaping  ([CharacterCardModel] )-> Void)
    func fetchVehicles(completion: @escaping ([VehiclesCardModel])-> Void)
    func fetchPlanets(completion: @escaping ([PlanetCardModel])-> Void)
}
