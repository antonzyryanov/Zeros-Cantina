//
//  HeroesCardsSelector.swift
//
//  Created by Anton Zyryanov on 18.07.25.
//

import Foundation

class HeroesCardsSelector {
    // MARK: State
    let heroes: [Hero]
    var heroId: Int = 0
    
    // MARK: Properties
    var previousHero: Hero? { return getPreviousHero() }
    var nextHero: Hero? { return getNextHero() }
    var currentHero: Hero { return heroes[heroId] }

    
    init() {
        heroes = [
            Hero("Darth Vader", speed: 6.0, power: 10.0, stamina: 6.0),
            Hero("Luke Skywalker", speed: 7.0, power: 8.0, stamina: 8.0),
            Hero("R2-D2", speed: 3.0, power: 2.0, stamina: 10.0),
            Hero("Leia Organa", speed: 6.0, power: 7.0, stamina: 7.0),
            Hero("Han Solo", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Obi-Wan Kenobi", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Yoda", speed: 5.0, power: 10.0, stamina: 6.0),
            Hero("Chewbacca", speed: 5.0, power: 9.0, stamina: 9.0),
            Hero("C-3PO", speed: 4.0, power: 3.0, stamina: 4.0),
            Hero("Boba Fett", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Palpatine", speed: 4.0, power: 10.0, stamina: 5.0),
            Hero("Rey", speed: 8.0, power: 7.0, stamina: 8.0),
            Hero("Kylo Ren", speed: 8.0, power: 8.0, stamina: 7.0),
            Hero("Anakin Skywalker", speed: 8.0, power: 9.0, stamina: 8.0),
            Hero("Padme Amidala", speed: 7.0, power: 7.0, stamina: 7.0),
            Hero("Mace Windu", speed: 7.0, power: 9.0, stamina: 8.0),
            Hero("Qui-Gon Jinn", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Lando Calrissian", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Jabba the Hutt", speed: 2.0, power: 8.0, stamina: 9.0),
            Hero("Darth Maul", speed: 9.0, power: 9.0, stamina: 7.0),
            Hero("Ahsoka Tano", speed: 8.0, power: 8.0, stamina: 8.0),
            Hero("Ezra Bridger", speed: 7.0, power: 7.0, stamina: 7.0),
            Hero("Kanan Jarrus", speed: 7.0, power: 7.0, stamina: 7.0),
            Hero("Sabine Wren", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Zeb", speed: 6.0, power: 8.0, stamina: 8.0),
            Hero("Hera Syndulla", speed: 7.0, power: 7.0, stamina: 7.0),
            Hero("Fennec Shand", speed: 8.0, power: 7.0, stamina: 6.0),
            Hero("Asajj Ventress", speed: 8.0, power: 8.0, stamina: 7.0),
            Hero("Cad Bane", speed: 8.0, power: 8.0, stamina: 6.0),
            Hero("Grand Moff Tarkin", speed: 5.0, power: 9.0, stamina: 6.0),
            Hero("Wicket W. Warrick", speed: 6.0, power: 3.0, stamina: 6.0),
            Hero("Nien Nunb", speed: 5.0, power: 4.0, stamina: 7.0),
            Hero("Bossk", speed: 6.0, power: 8.0, stamina: 8.0),
            Hero("IG-88", speed: 7.0, power: 9.0, stamina: 6.0),
            Hero("Dengar", speed: 6.0, power: 8.0, stamina: 7.0),
            Hero("Lobot", speed: 4.0, power: 3.0, stamina: 5.0),
            Hero("Mon Mothma", speed: 5.0, power: 6.0, stamina: 6.0),
            Hero("Wedge Antilles", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Biggs Darklighter", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Poe Dameron", speed: 9.0, power: 7.0, stamina: 7.0),
            Hero("Finn", speed: 8.0, power: 6.0, stamina: 8.0),
            Hero("Rose Tico", speed: 7.0, power: 5.0, stamina: 6.0),
            Hero("Jyn Erso", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("Cassian Andor", speed: 8.0, power: 6.0, stamina: 7.0),
            Hero("K-2SO", speed: 7.0, power: 7.0, stamina: 6.0),
            Hero("Saw Gerrera", speed: 6.0, power: 8.0, stamina: 8.0),
            Hero("Count Dooku", speed: 7.0, power: 9.0, stamina: 6.0),
            Hero("Darth Sidious", speed: 6.0, power: 10.0, stamina: 5.0),
            Hero("Bistan", speed: 7.0, power: 6.0, stamina: 7.0),
            Hero("Chirrut Imwe", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Baze Malbus", speed: 6.0, power: 8.0, stamina: 8.0),
            Hero("Jango Fett", speed: 8.0, power: 8.0, stamina: 7.0),
            Hero("Bren Derlin", speed: 6.0, power: 6.0, stamina: 7.0),
            Hero("Admiral Ackbar", speed: 4.0, power: 7.0, stamina: 6.0),
            Hero("General Hux", speed: 5.0, power: 8.0, stamina: 5.0),
            Hero("Captain Rex", speed: 8.0, power: 7.0, stamina: 8.0),
            Hero("Fives", speed: 8.0, power: 7.0, stamina: 8.0),
            Hero("Echo", speed: 8.0, power: 7.0, stamina: 8.0),
            Hero("Aayla Secura", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Shaak Ti", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Luminara Unduli", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("General Grievous", speed: 8.0, power: 9.0, stamina: 8.0),
            Hero("Yaddle", speed: 5.0, power: 9.0, stamina: 5.0),
            Hero("Jar Jar Binks", speed: 7.0, power: 3.0, stamina: 6.0),
            Hero("Watto", speed: 4.0, power: 4.0, stamina: 5.0),
            Hero("Sebulba", speed: 8.0, power: 7.0, stamina: 6.0),
            Hero("Darth Malgus", speed: 7.0, power: 9.0, stamina: 7.0),
            Hero("Galactic Republic Jedi", speed: 7.0, power: 8.0, stamina: 7.0),
            Hero("Separatist Droid", speed: 6.0, power: 5.0, stamina: 4.0),
            Hero("Clone Trooper", speed: 7.0, power: 6.0, stamina: 7.0)
        ]
    }
    
    private func getNextHero() -> Hero? {
        if !isNextHeroAvailable() { return nil }
        heroId += 1
        return heroes[heroId]
    }
    
    public func getPreviousHero() -> Hero? {
        if !isPreviousHeroAvailable() { return nil }
        heroId -= 1
        return heroes[heroId]
    }
    
    public func isNextHeroAvailable() -> Bool {
        return heroes.count - 1 > heroId
    }
    
    public func isPreviousHeroAvailable() -> Bool {
        return heroId > 0
    }
}
