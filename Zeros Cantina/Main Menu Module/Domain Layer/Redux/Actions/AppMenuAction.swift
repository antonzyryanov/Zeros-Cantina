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
        case set(isMusicOn: Bool)
        case setInitialActionsDone
    }
}

// MARK: - Items actions
extension AppMenuAction {
    
    enum ItemsAction {
        case setupItems
        case openItem(_ item: MenuItem)
        case itemWasOpened
        case setItems(_ items: [MenuItem])
    }
}

