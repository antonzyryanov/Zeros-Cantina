//
//  CardItemProtocol.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import Foundation

protocol CardItemProtocol {
    var title: String {get set}
    var description: String {get set}
    var imageLink: String {get set}
    var localImage: String {get set}
    var isFavorite: Bool {get set}
}
