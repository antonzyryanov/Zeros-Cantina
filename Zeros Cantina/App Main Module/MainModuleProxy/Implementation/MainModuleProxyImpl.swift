//
//  MainModuleProxyImpl.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

class MainModuleProxyImpl: MainModuleDataOutputProtocol {
    
    static let shared = MainModuleProxyImpl()
    
    internal var characters: [CharacterCardModel] = [] {
        didSet {
            NotificationCenter.default.post(name: .CharactersUpdated, object: nil)
        }
    }
    
    internal var vehicles: [VehiclesCardModel] = [] {
        didSet {
            NotificationCenter.default.post(name: .VehiclesUpdated, object: nil)
        }
    }
    
    internal var planets: [PlanetCardModel] = [] {
        didSet {
            NotificationCenter.default.post(name: .PlanetsUpdated, object: nil)
        }
    }
    
    private init() {
        
    }
    
}

extension MainModuleProxyImpl: CharactersModuleDataInputProtocol {
    var charactersUpdateSubscriptionKey: String {
        get {
            Notification.Name.CharactersUpdated.rawValue
        }
    }
    
    func requestCharactersData() {
        NotificationCenter.default.post(name: .CharactersRequest, object: nil)
    }
}

extension MainModuleProxyImpl: VehiclesModuleDataInputProtocol {
    var vehiclesUpdateSubscriptionKey: String {
        get {
            Notification.Name.VehiclesUpdated.rawValue
        }
    }
    
    func requestVehiclesData() {
        NotificationCenter.default.post(name: .VehiclesRequest, object: nil)
    }
    
    
}

extension MainModuleProxyImpl: PlanetsModuleDataInputProtocol {
    var planetsUpdateSubscriptionKey: String {
        get {
            Notification.Name.PlanetsUpdated.rawValue
        }
    }
    
    func requestPlanetsData() {
        NotificationCenter.default.post(name: .PlanetsRequest, object: nil)
    }
}
