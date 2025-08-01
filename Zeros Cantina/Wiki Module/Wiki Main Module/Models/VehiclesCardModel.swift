//
//  VehiclesCardModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

struct VehiclesCardModel: CardItemProtocol {
    var localImage: String
    
    var title: String
    var description: String
    var imageLink: String
    var isFavorite: Bool
}
