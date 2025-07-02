//
//  State.swift
//

import Foundation

struct AppState {
    var items: [Item] = []
    
    var isAlertPresented: Bool = false
    var alertStyle: AlertBuilder.AlertStyle = .success(text: "")
    
    var isLoaderPresented: Bool = false
}
