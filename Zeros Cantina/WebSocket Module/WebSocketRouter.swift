// 
//  WebSocketRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 09.08.2025.
//

import UIKit

final class WebSocketRouter: RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    var view: WebSocketViewController = WebSocketViewController()
    
    func createModule() {
        let presenter = WebSocketPresenter(view: view, router: self)
        view.presenter = presenter
    }
    
}
