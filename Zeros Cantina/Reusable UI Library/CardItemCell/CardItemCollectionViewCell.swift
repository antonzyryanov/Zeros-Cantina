//
//  CardItemCollectionViewCell.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 15.06.2025.
//

import UIKit
import SnapKit

class CardItemCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CardItemCell"
    
    var bgView = UIView()
    var cellImageView = UIImageView()
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
        bgView.addSubview(cellImageView)
        bgView.layer.borderWidth = 2
        bgView.layer.borderColor = UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1).cgColor
        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        cellImageView.layer.cornerRadius = 16
        cellImageView.layer.masksToBounds = true
        bgView.addSubview(cellTitle)
        cellTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(cellImageView.snp.bottom).inset(-16)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        cellTitle.textColor = . white
        cellTitle.font = .systemFont(ofSize: 24, weight: .bold)
        cellImageView.image = UIImage(named: "default_card_image")
    }
    
    func configureWith(model: CardItemProtocol) {
        cellTitle.text = model.title
    }
    
}
