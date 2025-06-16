//
//  PlanetsModuleDataInputProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

protocol PlanetsModuleDataInputProtocol {
    var planets: [PlanetCardModel] { get set }
    var planetsUpdateSubscriptionKey: String { get }
    func requestPlanetsData()
}
