//
//  Item.swift
//

import Foundation

struct Item: Identifiable, Faking {
    var id: UUID = .init()
    
    var title: String { "item: \(id.uuidString)" }
    var text: String? = nil
}
