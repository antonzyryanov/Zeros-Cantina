//
//  CharactersScreenViewController.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 14.06.2025.
//  
//

import UIKit

class CharactersScreenViewController: VCWithCustomTabBar {
    
    var presenter: ViewToPresenterCharactersScreenProtocol?
    
    var charactersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 64, 500)
        layout.scrollDirection = .vertical
        charactersCollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        charactersCollectionView.register(CardItemCollectionViewCell.self, forCellWithReuseIdentifier: CardItemCollectionViewCell.cellID)
        charactersCollectionView.delegate   = self
        charactersCollectionView.dataSource = self
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.bringSubviewToFront(charactersCollectionView)
    }

    private func setupCollectionView() {
        self.view.addSubview(charactersCollectionView)
        charactersCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(130)
        }
        charactersCollectionView.backgroundColor = .clear
        charactersCollectionView.reloadData()
    }
    
}

extension CharactersScreenViewController: PresenterToViewCharactersScreenProtocol{
}

extension CharactersScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardItemCollectionViewCell.cellID, for: indexPath)
                as! CardItemCollectionViewCell
        cell.setupCellUI()
        return cell
    }
    
}
