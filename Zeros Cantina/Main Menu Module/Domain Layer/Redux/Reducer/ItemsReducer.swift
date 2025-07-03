//
//  ItemsReducer.swift
//

import Foundation
import Combine

let itemsReducer: Reducer<AppState, AppMenuAction.ItemsAction> = Reducer { state, action in
    switch action {
    case .setItems(let items):
        state.isLoaderPresented = false
        state.items = items
        
    case .setupItems:
        return Just([MenuItem(title: "Wiki"),
                     MenuItem(title: "Quotes"),
                     MenuItem(title: "Settings")
                    ])
            .delay(for: 0.1, scheduler: DispatchQueue.main)
            .map { .setItems($0) }
            .eraseToAnyPublisher()
        
    case .openItem(let item):
        state.chosenItem = item.title
    case .itemWasOpened:
        state.chosenItem = nil
    default:
        break
    }
    
    return nil
}
