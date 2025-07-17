//
//  QuotesModuleRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 17.07.2025.
//

import Foundation
import UIKit
import SwiftUI

class QuotesScreenRouter: RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    var viewController: UIViewController?
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    func createModule() {
        var contentView = QuotesContentView()
        contentView.menuRouter = self
        let vc = UIHostingController(rootView: contentView)
        self.viewController = vc
    }
    
}
