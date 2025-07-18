//
//  HeroesCardsRouter.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 18.07.2025.
//

import Foundation
import UIKit

class HeroesCardsScreenRouter: RouterProtocol {
    
    weak var mainRouter: RouterProtocol? = nil
    
    var viewController: UIViewController?
    
    func navigateTo(screen: String) {
        mainRouter?.navigateTo(screen: screen)
    }
    
    func createModule() {
        let storyboard = UIStoryboard(name: "HeroesCardsViewController", bundle: nil)
        guard var vc = storyboard.instantiateViewController(withIdentifier: "HeroesCardsViewController") as? HeroesCardsViewController else { return }
        vc.router = self
        self.viewController = vc
    }
    
}
