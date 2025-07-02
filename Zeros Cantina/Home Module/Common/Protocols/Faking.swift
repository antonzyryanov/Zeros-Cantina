//
//  Faking.swift
//

import Foundation

protocol Faking {
    init()
    static func fakeItems(count: Int) -> [Self]
}

extension Faking {
    static func fakeItems(count: Int = 10) -> [Self] {
        (0..<count).map { _ in Self.init()}
    }
}
