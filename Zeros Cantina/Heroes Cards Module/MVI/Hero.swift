//
//  Hero.swift
//
//
//  Created by Anton Zyryanov on 18.07.25.
//

import Foundation

class Hero {
    let name: String
    let speed: Float
    let power: Float
    let stamina: Float
    
    init(_ name: String, speed: Float, power: Float, stamina: Float) {
        self.name = name
        self.speed = speed
        self.power = power
        self.stamina = stamina
    }
}
