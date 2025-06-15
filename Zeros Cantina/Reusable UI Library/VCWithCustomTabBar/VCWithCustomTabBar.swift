//
//  VCWithCustomTabBar.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import UIKit

class VCWithCustomTabBar: UIViewController {
    
    let tabBar: CustomTabBar = CustomTabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let backgroundImage = UIImage(named: "stars_background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        self.view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(64)
        }
        backgroundImageView.layer.borderWidth = 2
        backgroundImageView.layer.borderColor = UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1).cgColor
        backgroundImageView.layer.cornerRadius = 16
        backgroundImageView.clipsToBounds = true
        self.view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.height.equalTo(136)
            make.leading.trailing.bottom.equalToSuperview()
        }
        tabBar.customizeWith(configuration: CustomTabBarConfiguration(backgroundColor: .white, borderColor: UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1),
                                                                      buttonsColor: .white,borderWidth: 2, cornerRadius: 16, buttonsCornerRadius: 12,
            buttons: [
            CustomTabBarButtonModel(title: "Characters", image: UIImage(named: "characters_icon")!, action: {
            print("[VCWithCustomTabBar]: Characters screen opened")}),
            CustomTabBarButtonModel(title: "Vehicles", image: UIImage(named: "vehicles_icon")!, action: {
            print("[VCWithCustomTabBar]: Characters screen opened")}),
            CustomTabBarButtonModel(title: "Favorites", image: UIImage(named: "favorites_icon")!, action: {
            print("[VCWithCustomTabBar]: Characters screen opened")}),
            CustomTabBarButtonModel(title: "Settings", image: UIImage(named: "settings_icon")!, action: {
            print("[VCWithCustomTabBar]: Characters screen opened")}),
            
            ]
            )
        )
    }

}
