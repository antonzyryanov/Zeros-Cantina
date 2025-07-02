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
        
    case .loadItems:
        return Just(Item.fakeItems())
            .delay(for: 4, scheduler: DispatchQueue.main)
            .map { .setItems($0) }
            .eraseToAnyPublisher()
        
    case .updateItem(let item):
        state.items = state.items.arrayByUpdatingItem(item)
        
    default:
        break
    }
    
    return nil
}
