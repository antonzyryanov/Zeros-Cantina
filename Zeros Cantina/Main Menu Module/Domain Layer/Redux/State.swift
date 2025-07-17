//
//  State.swift
//

import Foundation

struct AppState {
    var items: [MenuItem] = []
    var isAlertPresented: Bool = false
    var alertStyle: AlertBuilder.AlertStyle = .success(text: "")
    var isLoaderPresented: Bool = false
    var chosenItem: String?
    var isMusicOn: Bool = false
    var areInitialActionsPerformed = false
}
