//
//  MapsRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 13.08.2025.
//

import Foundation
import UIKit

@objcMembers class MapsRouter: NSObject, RouterProtocol {
    
    var mainRouter: RouterProtocol?
    
    var viewController: UIViewController?
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: "Menu")
    }
    
    @objc func closeModule() {
        navigateTo(screen: "Menu")
    }
    
    func createModule() {
        let viewController = MapsViewController()
        viewController.router = self
        self.viewController = viewController
    }
    
}
