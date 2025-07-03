//
//  MenuScreenRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 03.07.2025.
//

import Foundation
import UIKit
import SwiftUI

class MenuScreenRouter: RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    let menuStore: MenuStore<AppState, AppMenuAction> = .init(initialState: AppState(), reducer: appReducer)
    var viewController: UIViewController?
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    func createModule() {
        let contentView = HomeView().environmentObject(menuStore)
        menuStore.menuRouter = self
        let vc = UIHostingController(rootView: contentView)
        self.viewController = vc
    }
    
}
