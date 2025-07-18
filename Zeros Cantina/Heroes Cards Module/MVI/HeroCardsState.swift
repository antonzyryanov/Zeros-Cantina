//
//  HeroCardsState.swift
//
//
//  Created by Anton Zyryanov on 18.07.25.
//

import Foundation

protocol HeroCardsState { }

class HeroPresenting: HeroCardsState {
    let hero: Hero
    let nextAvailable: Bool
    let previousAvailable: Bool

    
    init(withHero hero: Hero, nextAvailable next: Bool, previousAvailable previous: Bool) {
        self.hero = hero
        self.nextAvailable = next
        self.previousAvailable = previous
    }
}

class HeroSelected: HeroCardsState {
    let hero: Hero
    
    init(selectedHero hero: Hero) {
        self.hero = hero
    }
}
