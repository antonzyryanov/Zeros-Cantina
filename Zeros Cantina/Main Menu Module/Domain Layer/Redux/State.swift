//
//  State.swift
//

import Foundation

struct AppState {
    var items: [MenuItem] = [MenuItem(title: "Wiki")]
    
    var isAlertPresented: Bool = false
    var alertStyle: AlertBuilder.AlertStyle = .success(text: "")
    var isLoaderPresented: Bool = false
    var chosenItem: String?
}
