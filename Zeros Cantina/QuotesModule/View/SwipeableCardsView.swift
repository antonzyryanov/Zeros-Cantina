//
//  SwipeableCardsView.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import Foundation
import SwiftUI

struct SwipeableCardsView: View {
    
    @ObservedObject var viewModel: SwipeableCardsViewModel
    @State private var dragState = CGSize.zero {
        didSet {
            print("[SwipeableCardsView]: DragState = \(dragState)")
        }
    }
    @State private var cardRotation: Double = 0
    
    private let swipeThreshold: CGFloat = 100.0
    private let rotationFactor: Double = 35.0
    
    var action: (SwipeableCardsViewModel) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            if viewModel.unswipedCards.isEmpty && viewModel.swipedCards.isEmpty {
                emptyCardsView
                    .frame(width: geometry.size.width, height: geometry.size.height)
            } else if viewModel.unswipedCards.isEmpty {
                swipingCompletionView
                    .frame(width: geometry.size.width, height: geometry.size.height)
            } else {
                ZStack {
                    
                    ForEach(viewModel.unswipedCards.reversed()) { card in
                        let isTop = card == viewModel.unswipedCards.first
                        let isSecond = card == viewModel.unswipedCards.dropFirst().first
                        CardView(
                            model: card,
                            size: geometry.size,
                            dragOffset: dragState,
                            isTopCard: isTop,
                            isSecondCard: isSecond
                        )
                        .offset(x: isTop ? dragState.width : 0)//
                        .rotationEffect(.degrees(isTop ? Double(dragState.width) / rotationFactor : 0))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    self.dragState = gesture.translation
                                    self.cardRotation = Double(gesture.translation.width) / rotationFactor
                                }
                                .onEnded { _ in
                                    if abs(self.dragState.width) > swipeThreshold {
                                        let swipeDirection: CardSwipeDirection = self.dragState.width > 0 ? .right : .left
                                        viewModel.updateTopCardSwipeDirection(swipeDirection)
                                        
                                        withAnimation(.easeOut(duration: 0.5)) {
                                            self.dragState.width = self.dragState.width > 0 ? 1000 : -1000
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            self.viewModel.removeTopCard()
                                            self.dragState = .zero
                                        }
                                    } else {
                                        withAnimation(.spring()) {
                                            self.dragState = .zero
                                            self.cardRotation = 0
                                        }
                                    }
                                }
                        )
                        .animation(.easeInOut, value: dragState)
                        
                        
                    }
                    
                }
            }
            
        }
        
    }
    
    var emptyCardsView: some View {
        VStack {
            Text("No Cards")
                .font(.title)
                .padding(.bottom, 20)
                .foregroundStyle(.gray)
        }
    }
    
    var swipingCompletionView: some View {
        VStack {
            Text("Finished quotes swiping")
                .font(.title)
                .padding(.bottom, 20)
                .foregroundColor(.yellow)
            Button(action: {
                action(viewModel)
            }) {
                Text("Reset")
                    .font(.headline)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
