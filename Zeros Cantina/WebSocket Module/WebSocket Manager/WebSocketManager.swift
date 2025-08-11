//
//  WebSocketManager.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 09.08.2025.
//

import Foundation

class WebSocketManager {
    
    private var dataArray = [WebSocketInputModel]()
    
    let webSocketTask: URLSessionWebSocketTask? = URLSession(configuration: .default).webSocketTask(with: URL(string: "wss://echo.websocket.org")!)
    
    public func connectToWebSocket(completion: @escaping (WebSocketInputModel?) -> Void) {
        webSocketTask?.resume()
        self.receiveData(completion: completion)
    }
    
    func sendMessageToServer(message: String) async {
        do {
            try await webSocketTask?.send(.string(message))
        } catch (let error) {
            print("[WebSocketManager]: Send Message Error\(error)")
        }
    }
    
    func receiveData(completion: @escaping (WebSocketInputModel?) -> Void) {
      webSocketTask?.receive { result in
        switch result {
            case .failure(let error):
              print("Error in receiving message: \(error)")
            case .success(let message):
              switch message {
                case .string(let text):
                  print("[WebSocketManager]: Recieved String from server: \(text)")
                  completion(WebSocketInputModel(serverMessage: text))
                case .data(let data):
                  let serverStringMessage = String(decoding: data, as: UTF8.self)
                  print("[WebSocketManager]: Recieved Data from server: \(serverStringMessage)")
                  completion(WebSocketInputModel(serverMessage: serverStringMessage))
              @unknown default:
                debugPrint("Unknown message")
              }
              
              self.receiveData(completion: completion)
        }
      }
    }
}
