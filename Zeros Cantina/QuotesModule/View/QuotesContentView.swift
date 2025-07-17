//
//  QuotesContentView.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import Foundation
import SwiftUI

struct QuotesContentView: View {
    
    weak var menuRouter: RouterProtocol? = nil
    var viewModel: SwipeableCardsViewModel = SwipeableCardsViewModel()
    
    var body: some View {
        ZStack {
            Image("stars_background")
            
            VStack {
                SwipeableCardsView(viewModel: viewModel) { model in
                    print(model.swipedCards)
                    model.reset()
                }
            }
            .padding()
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Image("home_icon")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32,height: 32)
                            .foregroundColor(.white)
                        .onTapGesture {
                            menuRouter?.navigateTo(screen: "Menu")
                        }
                        
                    }.frame(width: 64,height: 64)
                        .padding(.trailing, 12)
                }.frame(width: UIScreen.main.bounds.width,height: 64).fixedSize(horizontal: true, vertical: false)
                    .padding(.top, 20)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height).fixedSize(horizontal: false, vertical: true)
        }
    }
}
