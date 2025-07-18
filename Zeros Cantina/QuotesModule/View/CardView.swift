//
//  CardView.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import SwiftUI

struct CardView: View {
    
    var model: SwipeableCardModel
    var size: CGSize
    var dragOffset: CGSize
    var isTopCard: Bool
    var isSecondCard: Bool

    var body: some View {
        VStack {
            Spacer(minLength: 200)
            HStack {
                Spacer(minLength: 60)
                    VStack {
                        Spacer().frame(height: 32)
                        Image("Yoda").resizable().scaledToFit().frame(height: 200).cornerRadius(16).padding(8)
                        Spacer().frame(height: 32)
                        Text(model.text).multilineTextAlignment(.center)
                        Spacer()
                    }
                        .frame(width: 300,height: 650, alignment: .center)
                        .background(Image("hall_background_4").resizable().scaledToFill())
                        .cornerRadius(15)
                        .shadow(color: isTopCard ? getShadowColor() : (isSecondCard && dragOffset.width != 0 ? Color.yellow.opacity(0.6) : Color.clear), radius: 10, x: 0, y: 3)
                        .foregroundColor(Color.mint)
                        .font(.title)
                        
                        .padding()
                    
                
                Spacer(minLength: 60)
            }
            Spacer(minLength: 220)
        }
        
    }
    
    private func getShadowColor() -> Color {
        if dragOffset.width > 0 {
            return Color.blue.opacity(0.8)
        } else if dragOffset.width < 0 {
            return Color.red.opacity(0.8)
        } else {
            return Color.gray.opacity(0.2)
        }
    }
}
