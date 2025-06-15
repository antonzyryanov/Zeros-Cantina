//
//  RoutersFactoryProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

protocol ModulesFactoryProtocol {
    func createMainModule(dataRepository: MainDataRepositoryProtocol) -> RouterProtocol
}
