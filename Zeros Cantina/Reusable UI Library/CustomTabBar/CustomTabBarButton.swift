//
//  CustomTabBarButton.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//

import UIKit
import SnapKit

class CustomTabBarButton: UIView {
    
    var titleLabel: UILabel?
    var imageView: UIImageView?
    var backgroundView: UIView?
    var tapAction: (()->Void)?
    var navigateToScreen: ((String)->Void)? = nil
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupWith(model: CustomTabBarButtonModel) {
        setupBackgroundView()
        setup(image: model.image)
        setup(title: model.title)
        self.tapAction = model.action
        setupTapGesture()
    }
    
    private func setup(title: String) {
        let titleLabel =  UILabel()
        self.titleLabel = titleLabel
        self.titleLabel?.text = title
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(36)
        }
    }
    
    private func setup(image: UIImage) {
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .black
        self.imageView = imageView
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(54)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(12)
        }
    }
    
    private func setupBackgroundView() {
        let backgroundView = UIView()
        self.backgroundView = backgroundView
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func setupTapGesture() {
        guard let view = self.backgroundView else { return }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.buttonTapAction))
        view.addGestureRecognizer(tap)
    }
    
    private func playTapAnimations() {
        
        guard let backgroundImage = imageView else { return }
        backgroundImage.tintColor = UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1)
        self.titleLabel?.textColor = UIColor.init(red: 218/255, green: 200/255, blue: 73/255, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            backgroundImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.titleLabel?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            
            UIView.animate(withDuration: 0.1) {
                backgroundImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.titleLabel?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            } completion: { _ in
                backgroundImage.tintColor = UIColor.black
                self.titleLabel?.textColor = UIColor.black
            }
        }

    }
    
    @objc func buttonTapAction() {
        playTapAnimations()
        tapAction?()
        navigateToScreen?(titleLabel?.text ?? "")
    }
    
}
