//
//  WSServerMessageCell.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 11.08.2025.
//

import Foundation
import UIKit

class WSServerMessageCell: UITableViewCell {
    
    static let cellID = "WSServerMessageCell"
    
    var bgView = UIView()
    var cellTitle = UILabel()
    
    func setupCellUI() {
        self.contentView.addSubview(bgView)
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true
        bgView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(16)
        }
        bgView.layer.cornerRadius = 16
        bgView.clipsToBounds = true
        bgView.backgroundColor = .purple
        bgView.layer.borderWidth = 2
        bgView.layer.borderColor = UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1).cgColor
        bgView.addSubview(cellTitle)
        cellTitle.snp.makeConstraints { make in
            make.center.equalTo(contentView.snp.center)
            make.height.equalTo(80)
            make.width.equalTo(300)
        }
        cellTitle.textColor = . white
        cellTitle.font = .systemFont(ofSize: 16, weight: .semibold)
        cellTitle.numberOfLines = 2
        self.backgroundColor = .clear
        let selectedBGView = UIView()
        selectedBGView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = selectedBGView
    }
    
    func configureWith(model: WebSocketInputModel) {
        cellTitle.text = model.serverMessage
    }
    
}
