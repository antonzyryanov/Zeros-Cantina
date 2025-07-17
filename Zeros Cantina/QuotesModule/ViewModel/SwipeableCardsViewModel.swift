//
//  SwipeableCardsViewModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import Foundation

class SwipeableCardsViewModel: ObservableObject {
    private var originalCards: [SwipeableCardModel]
    @Published var unswipedCards: [SwipeableCardModel]
    @Published var swipedCards: [SwipeableCardModel]
    
    let model = QuotesModel()
    
    init() {
        self.originalCards = model.cards
        self.unswipedCards = model.cards
        self.swipedCards = []
    }
    
    func removeTopCard() {
        if !unswipedCards.isEmpty {
            guard let card = unswipedCards.first else { return }
            unswipedCards.removeFirst()
            swipedCards.append(card)
        }
    }
    
    func updateTopCardSwipeDirection(_ direction: CardSwipeDirection) {
        if !unswipedCards.isEmpty {
            unswipedCards[0].swipeDirection = direction
        }
    }
    
    func reset() {
        unswipedCards = originalCards
        swipedCards = []
    }
}
