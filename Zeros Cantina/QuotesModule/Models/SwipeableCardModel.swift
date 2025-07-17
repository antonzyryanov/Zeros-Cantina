//
//  CardModel.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import Foundation

struct SwipeableCardModel: Identifiable, Equatable {
    let id = UUID()
    let text: String
    var swipeDirection: CardSwipeDirection = .none
}
