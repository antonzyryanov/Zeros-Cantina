//
//  CharactersModuleDataInputProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

protocol CharactersModuleDataInputProtocol {
    var characters: [CharacterCardModel] { get set }
    var charactersUpdateSubscriptionKey: String { get }
    func requestCharactersData()
}
