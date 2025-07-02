//
//  VehiclesModuleDataInputProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

protocol VehiclesModuleDataInputProtocol {
    var vehicles: [VehiclesCardModel] { get set }
    var vehiclesUpdateSubscriptionKey: String { get }
    func requestVehiclesData()
}
