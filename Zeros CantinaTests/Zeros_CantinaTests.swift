//
//  Zeros_CantinaTests.swift
//  Zeros CantinaTests
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import XCTest
@testable import Zeros_Cantina

final class Zeros_CantinaTests: XCTestCase {

    func test_whenScreenIsShown_thenTabBarButtonsShowed() {
        let charactersRouter = CharactersScreenRouter()
        let mainModuleProxy = MainModuleProxyImpl.shared
        charactersRouter.createModule(charactersDataInput: mainModuleProxy)
        guard let charactersVC = charactersRouter.presenter.view as? CharactersScreenViewController else {
            return
        }
        charactersVC.viewDidLoad()
        charactersVC.viewWillAppear(false)
        let numberOfButtons = charactersVC.tabBar.buttonsViews.count
        XCTAssert(numberOfButtons>0)
    }
    
    func test_WhenTabBarButtonTapped_ThenItChangesColor() {
        let tabBar = CustomTabBar()
        let tabBarCustomConfiguration = CustomTabBarConfiguration(backgroundColor: .white, borderColor: .red, buttonsColor: .red, borderWidth: 2, cornerRadius: 16, buttonsCornerRadius: 12, buttons: [CustomTabBarButtonModel(title: "Foo", image: UIImage(named: "settings_icon")!, action: {
            
        }),
                                                                                                                                                                                                       CustomTabBarButtonModel(title: "Bar", image: UIImage(named: "settings_icon")!, action: {
                                                                                                                                                                                                       })
                                                                                                                                                                                                      ])
        tabBar.customizeWith(configuration: tabBarCustomConfiguration)
        guard let firstButton = tabBar.buttonsViews.first else { return }
        firstButton.buttonTapAction()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssert(firstButton.backgroundView?.backgroundColor != .red)
        }
    }

}
