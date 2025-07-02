//
//  CommonReducer.swift

//

import Foundation

let commonReducer: Reducer<AppState, AppMenuAction.CommonAction> = Reducer { state, action in
    switch action {
    case .setIsAlert(let presented):
        state.isAlertPresented = presented
        
    case .showAlert(let style):
        state.alertStyle = style
        state.isAlertPresented = true
        
    case .setIsLoaderPresented(let presented):
        state.isLoaderPresented = presented
    }
    
    return nil
}
