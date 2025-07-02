//
//  DataRepositoryWorkerProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import Foundation

protocol DataRepositoryWorkerProtocol {
    func fetchCards(completion: @escaping (([CardItemProtocol]) -> Void), cardType: String)
}
