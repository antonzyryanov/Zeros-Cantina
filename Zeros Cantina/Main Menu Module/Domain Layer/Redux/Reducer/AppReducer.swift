//
//  AppReducer.swift

import Foundation
import Combine

let appReducer: Reducer<AppState, AppMenuAction> = Reducer { state, action in
    switch action {
    case .items(let itemsAction):
        return itemsReducer.reduce(&state, itemsAction)?
            .map { AppMenuAction.items(action: $0) }
            .eraseToAnyPublisher()
        
    case .common(let commonAction):
        return commonReducer.reduce(&state, commonAction)?
            .map { AppMenuAction.common(action: $0) }
            .eraseToAnyPublisher()
    }
}
