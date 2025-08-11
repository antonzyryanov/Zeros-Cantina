//
//  UIColor + Extensions.swift
//  Stocks
//
//  Created by Anton Zyryanov on 21.07.2025.
//

import UIKit

extension UIColor {
    
    static var stocksYellow: UIColor {
        return .yellow
    }
    
    static var stocksWhite: UIColor {
        return .white
    }
    
    static var stocksBGWhite: UIColor {
        return .white.withAlphaComponent(0.8)
    }
    
    static var stocksGreen: UIColor {
        return UIColor(red: 36/255, green: 178/255, blue: 93/255, alpha: 1)
    }
    
    static var stocksRed: UIColor {
        return UIColor(red: 178/255, green: 36/255, blue: 36/255, alpha: 1)
    }
    
    static var stocksGold: UIColor {
        return UIColor(red: 255/255, green: 202/255, blue: 28/255, alpha: 1)
    }
    
}
