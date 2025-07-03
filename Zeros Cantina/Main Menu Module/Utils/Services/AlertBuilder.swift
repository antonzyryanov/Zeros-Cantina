//
//  AlertBuilder.swift
//

import SwiftUI

enum AlertBuilder {
    
    enum AlertStyle {
        case success(text: String)
        case failure(text: String)
        case custom(title: String, text: String, primaryButton: Alert.Button, secondaryButton: Alert.Button)
        case customDismiss(title: String, text: String, dismissButton: Alert.Button)
    }
    
    static func buildAlert(for style: AlertStyle) -> Alert {
        switch style {
        case .success(let text):
            return alert(title: "Success", text: text) //Localized string should be here
            
        case .failure(let text):
            return alert(title: "Error", text: text) //Localized string should be here
            
        case let .customDismiss(title, text, dismissButton):
            return alert(title: title, text: text, dismissButton: dismissButton)
            
        case let .custom(title, text, primaryButton, secondaryButton):
            return alert(title: title, text: text, primaryButton: primaryButton, secondaryButton: secondaryButton)
        }
    }
}


// MARK: - Alerts
private extension AlertBuilder {
    
    static func alert(title: String, text: String) -> Alert {
        Alert(title: Text(title), message: Text(text), dismissButton: .default(Text("Ok")))
    }
    
    static func alert(title: String, text: String, primaryButton: Alert.Button, secondaryButton: Alert.Button) -> Alert {
        Alert(title: Text(title), message: Text(text), primaryButton: primaryButton, secondaryButton: secondaryButton)
    }
    
    static func alert(title: String, text: String, dismissButton: Alert.Button) -> Alert {
        Alert(title: Text(title), message: Text(text), dismissButton: dismissButton)
    }
}

