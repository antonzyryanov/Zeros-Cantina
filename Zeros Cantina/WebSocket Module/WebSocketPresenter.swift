// 
//  WebSocketPresenter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 09.08.2025.
//

import Foundation

protocol WebSocketPresenterProtocol: AnyObject {
    init(view: WebSocketViewControllerProtocol, router: RouterProtocol)
    func closeModule()
    func sendMessageToServer(message: String) async
}

final class WebSocketPresenter: WebSocketPresenterProtocol {
    
    private let webSocketManager: WebSocketManager = WebSocketManager()
    private let model: [WebSocketInputModel] = []
    
    func closeModule() {
        router?.navigateTo(screen: "Menu")
    }
    
    private weak var view: WebSocketViewControllerProtocol?
    private var router: RouterProtocol?
    
    init(view: WebSocketViewControllerProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        setupWebSocket()
    }
    
    func sendMessageToServer(message: String) async {
        await webSocketManager.sendMessageToServer(message: message)
    }
    
    private func setupWebSocket() {
        webSocketManager.connectToWebSocket(completion: updateView(serverResponse:)
        )
    }

    private func updateView(serverResponse: WebSocketInputModel?) -> Void {
        print("[WebSocketPresenter] will show message from server: \(String(describing: serverResponse?.serverMessage))")
        if let message = serverResponse?.serverMessage {
            DispatchQueue.main.async {
                self.view?.showServerResponse(message: message)
            }
        }
    }
    
}
