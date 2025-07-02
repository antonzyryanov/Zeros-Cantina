//
//  AppAction.swift
//

import Foundation

enum AppMenuAction {
    case common(action: CommonAction)
    case items(action: ItemsAction)
}

// MARK: - Common actions
extension AppMenuAction {
    
    enum CommonAction {
        case setIsAlert(presented: Bool)
        case showAlert(style: AlertBuilder.AlertStyle)
        case setIsLoaderPresented(presented: Bool)
    }
}

// MARK: - Items actions
extension AppMenuAction {
    
    enum ItemsAction {
        case loadItems
        case updateItem(_ item: Item)
        case deleteItem(_ item: Item)
        
        case setItems(_ items: [Item])
    }
}

