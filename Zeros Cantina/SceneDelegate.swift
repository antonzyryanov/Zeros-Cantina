//
//  SceneDelegate.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var diContainer: DIContainer?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if diContainer == nil {
            diContainer = DIContainer()
            showUIToUserAfterDIFinished()
        }
    }
    
    @objc func showUIToUserAfterDIFinished() {
        guard let mainRouter = diContainer?.rootRouter as? MainRouter else { return }
        mainRouter.showCharactersScreen()
    }

}

