//
//  MainModuleOutputProtocol.swift.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

protocol MainModuleDataOutputProtocol {
    
    var characters: [CharacterCardModel] { get set }
    var vehicles: [VehiclesCardModel] { get set }
    
}
